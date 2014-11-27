package com.hrms.action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.hrms.model.Dept;
import com.hrms.model.Employee;
import com.hrms.model.Recruit;
import com.hrms.model.User;
import com.hrms.service.IDeptService;
import com.hrms.service.IEmployeeService;
import com.hrms.service.IRecruitService;
import com.hrms.util.Page;

@Component("recruitAction")
@Scope("prototype")
public class RecruitAction extends BaseAction {
	private static final long serialVersionUID = -2189912374125938498L;
	private Recruit recruit;
	private Integer recruitId;
	private IRecruitService recruitService;
	private IEmployeeService employeeService;
	private IDeptService deptService;
	private List<Recruit> recruits;
	private Page page;
	private int currentPage = 1;

	public String recruit_list() {
		int totalSzie = recruitService.getSize();
		this.page = new Page(currentPage, totalSzie);
		recruits = recruitService.getListByPageByDesc(currentPage, page
				.getPageSize(), "applyDate");
		return "success";
	}

	public String recruit_my() {
		User user = (User) getSession().getAttribute("user");
		String hql = "from Recruit r where r.applyPerson = '"
				+ user.getUserTrueName() + "' order by applyDate desc";
		int totalSzie = recruitService.getListSize(hql);
		this.page = new Page(currentPage, totalSzie);
		recruits = recruitService.findAllByPage(hql, currentPage, page
				.getPageSize());
		return "success";
	}

	public String recruit_detail() {
		if (recruitId != null) {
			recruit = recruitService.findById(recruitId);
			return "success";
		} else {
			return "error";
		}
	}

	public String recruit_add() {
		request = getRequest();
		String addAction = request.getParameter("addAction");
		if (addAction == null) {
			User user = (User) getSession().getAttribute("user");
			Integer empId = user.getEmpId();
			Employee employee = employeeService.findById(empId);
			getRequest().setAttribute("employee", employee);
			return "add";
		}
		recruitService.saveOrUpdate(recruit);
		return "success";
	}

	public String recruit_update() {
		request = getRequest();
		recruit = recruitService.findById(recruitId);
		String state = recruit.getState();
		if (state != null && !state.equals("未提交")) {
			request.setAttribute("errorMessage", "该申请已提交审批流程中，不需再提交，也不能修改和删除！");
			request.setAttribute("forwardLink", "recruit_my?currentPage="+ currentPage);
			return "error";
		}
		String update = getRequest().getParameter("update");
		if (update != null && update.equals("update")) {
			recruitService.update(recruit);
			return "success";
		} else if (recruitId != null) {
			recruit = recruitService.findById(recruitId);
			return "update";
		} else {
			return "error";
		}
	}

	public String recruit_delete() {
		request = getRequest();
		recruit = recruitService.findById(recruitId);
		String state = recruit.getState();
		if (state != null && !state.equals("未提交")) {
			request.setAttribute("errorMessage", "该申请已提交审批流程中，不需再提交，也不能修改和删除！");
			request.setAttribute("forwardLink", "recruit_my?currentPage="+ currentPage);
			return "error";
		}
		if (recruitId != null) {
			recruitService.deleteById(recruitId);
			return "success";
		}
		return "error";
	}

	public String recruit_submit() {
		request = getRequest();
		String submit = request.getParameter("submit");
		if (submit == null || submit.equals("")) {
			recruit = recruitService.findById(recruitId);
			String state = recruit.getState();
			if (state == null || state.equals("未提交")) {
				Dept dept = deptService.findByDeptName("人力资源部");
				if (dept != null) {
					request.setAttribute("employees", dept.getEmployees());
				} else {
					dept = deptService.findByDeptName(recruit.getApplyPerson());
					request.setAttribute("employees", dept.getDeptMan());
				}
				return "submit";
			}

		}
		if (submit != null && submit.equals("submit")) {
			String state = recruit.getState();
			String approver = recruit.getApprover();
			recruit = recruitService.findById(recruitId);
			recruit.setState(state);
			recruit.setApprover(approver);
			recruitService.update(recruit);
			return "success";
		}
		request.setAttribute("errorMessage", "该申请已提交审批流程中，不需再提交，也不能修改和删除！");
		request.setAttribute("forwardLink", "recruit_my?currentPage="+ currentPage);
		return "error";
	}

	public String recruit_approverList() {
		User user = (User) getSession().getAttribute("user");
		String hql = "from Recruit r where r.approver = '"
				+ user.getUserTrueName() + "' order by applyDate desc";
		int totalSzie = recruitService.getListSize(hql);
		this.page = new Page(currentPage, totalSzie);
		recruits = recruitService.findAllByPage(hql, currentPage, page
				.getPageSize());
		return "success";
	}
	
	public String recruit_approver() {
		String approver = getRequest().getParameter("approver");
		if(approver == null || approver.equals("")) {
			recruit = recruitService.findById(recruitId);
			getRequest().setAttribute("oldState", recruit.getState());
			recruit.setState("审批中");
			recruitService.update(recruit);
			return "approver";
		}
		Date approveDate = recruit.getApproveDate();
		String approverOption = recruit.getApproverOption();
		String approveResult = recruit.getApproveResult();
		recruit = recruitService.findById(recruitId);
		recruit.setApproveDate(approveDate);
		recruit.setApproverOption(approverOption);
		recruit.setApproveResult(approveResult);
		recruit.setState("已审批");
		recruitService.update(recruit);
		return "success";
	}
	public String recruit_approverCancel() {
		recruit = recruitService.findById(recruitId);
		recruit.setState(getRequest().getParameter("oldState"));
		recruitService.update(recruit);
		return "success";
	}
	public String recruit_approverEnd() {
		recruit = recruitService.findById(recruitId);
		recruit.setState("审批完毕");
		recruitService.update(recruit);
		return "success";
	}
	public String recruit_publish() {
		request = getRequest();
		String publish = request.getParameter("publish");
		if (publish == null || !publish.equals("publish")) {
			recruit = recruitService.findById(recruitId);
			return "publish";
		}
		Date publishDate = recruit.getPublishDate();
		Date deadline = recruit.getDeadline();
		String applyPersonEmail = recruit.getApplyPersonEmail();
		recruit = recruitService.findById(recruitId);
		recruit.setPublishDate(publishDate);
		recruit.setDeadline(deadline);
		recruit.setApplyPersonEmail(applyPersonEmail);
		recruit.setState("已发布");
		recruitService.update(recruit);
		return "success";
	}
	
	public String recruit_send() {
		request = getRequest();
		recruit = recruitService.findById(recruitId);
		String send = request.getParameter("send");
		if (send == null || !send.equals("send")) {
			request.setAttribute("employees", employeeService.findAll());
			return "send";
		}
		
		String approver = request.getParameter("recruit.approver");
		recruit.setApprover(approver);
		recruit.setApproveResult(null);
		recruit.setApproverOption(null);
		recruit.setState("待审批");
		recruitService.update(recruit);
		return "success";
	}
	public Recruit getRecruit() {
		return recruit;
	}

	public void setRecruit(Recruit recruit) {
		this.recruit = recruit;
	}

	public Integer getRecruitId() {
		return recruitId;
	}

	public void setRecruitId(Integer recruitId) {
		this.recruitId = recruitId;
	}

	public IRecruitService getRecruitService() {
		return recruitService;
	}

	@Resource
	public void setRecruitService(IRecruitService recruitService) {
		this.recruitService = recruitService;
	}

	public List<Recruit> getRecruits() {
		return recruits;
	}

	public void setRecruits(List<Recruit> recruits) {
		this.recruits = recruits;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public IEmployeeService getEmployeeService() {
		return employeeService;
	}

	@Resource
	public void setEmployeeService(IEmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public IDeptService getDeptService() {
		return deptService;
	}

	@Resource
	public void setDeptService(IDeptService deptService) {
		this.deptService = deptService;
	}
}
