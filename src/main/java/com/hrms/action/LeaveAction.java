package com.hrms.action;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.hrms.model.Dept;
import com.hrms.model.Employee;
import com.hrms.model.Leave;
import com.hrms.model.User;
import com.hrms.service.IDeptService;
import com.hrms.service.IEmployeeService;
import com.hrms.service.ILeaveService;
import com.hrms.service.ILeaveTypeService;
import com.hrms.util.Page;

@Component("leaveAction")
@Scope("prototype")
public class LeaveAction extends BaseAction {
	private static final long serialVersionUID = 952804024763378084L;
	private Leave leave;
	private Integer leaveId;
	private ILeaveService leaveService;
	private List<Leave> leaves;
	private Page page;
	private int currentPage = 1;
	private IDeptService deptService;
	private IEmployeeService employeeService;
	private ILeaveTypeService leaveTypeService;
	
	public String leave_list() {
		int totalSzie = leaveService.getSize();
		this.page = new Page(currentPage, totalSzie);
		leaves = leaveService.getListByPageByDesc(currentPage, page
				.getPageSize(), "applyDate");
		return "success";
	}

	public String leave_my() {
		User user = (User) getSession().getAttribute("user");
		String hql = "from Leave l where l.applyPerson = '"
				+ user.getUserTrueName() + "' order by applyDate desc";
		int totalSzie = leaveService.getListSize(hql);
		this.page = new Page(currentPage, totalSzie);
		leaves = leaveService.findAllByPage(hql, currentPage, page
				.getPageSize());
		return "success";
	}

	public String leave_detail() {
		if (leaveId != null) {
			leave = leaveService.findById(leaveId);
			return "success";
		} else {
			return "error";
		}
	}

	public String leave_add() {
		request = getRequest();
		String addAction = request.getParameter("addAction");
		if (addAction == null) {
			User user = (User) getSession().getAttribute("user");
			Integer empId = user.getEmpId();
			Employee employee = employeeService.findById(empId);
			request.setAttribute("employee", employee);
			request.setAttribute("leaveTypes", leaveTypeService.findAll());
			return "add";
		}
		String leaveType = request.getParameter("leaveType");
		if(leaveType != null && !leaveType.equals(""))
			leave.setLeaveType(leaveTypeService.findById(Integer.valueOf(leaveType)));
		leaveService.saveOrUpdate(leave);
		return "success";
	}

	public String leave_update() {
		request = getRequest();
		String update = getRequest().getParameter("update");
		if (update != null && update.equals("update")) {
			String leaveType = request.getParameter("leaveType");
			if(leaveType != null && !leaveType.equals(""))
				leave.setLeaveType(leaveTypeService.findById(Integer.valueOf(leaveType)));
			leaveService.update(leave);
			return "success";
		} else if (leaveId != null) {
			leave = leaveService.findById(leaveId);
			request.setAttribute("leaveTypes", leaveTypeService.findAll());
			return "update";
		} else {
			return "error";
		}
	}

	public String leave_delete() {
		request = getRequest();
		leave = leaveService.findById(leaveId);
		String state = leave.getState();
		if (state != null && !state.equals("未提交")) {
			request.setAttribute("errorMessage", "该申请已提交审批流程中，不需再提交，也不能修改和删除！");
			request.setAttribute("forwardLink", "recruit_my?currentPage="+ currentPage);
			return "error";
		}
		if (leaveId != null) {
			leaveService.deleteById(leaveId);
			return "success";
		}
		return "error";
	}

	public String leave_submit() {
		request = getRequest();
		String submit = request.getParameter("submit");
		if (submit == null || submit.equals("")) {
			leave = leaveService.findById(leaveId);
			String state = leave.getState();
			if (state == null || state.equals("未提交") || state.equals("")) {
				Dept dept = deptService.findByDeptName(leave.getApplyDept());
				request.setAttribute("employees", dept.getDeptMan());
				return "submit";
			}

		}
		if (submit != null && submit.equals("submit")) {
			String state = leave.getState();
			String approver = leave.getApprover();
			leave = leaveService.findById(leaveId);
			leave.setState(state);
			leave.setApprover(approver);
			leaveService.update(leave);
			return "success";
		}
		request.setAttribute("errorMessage", "该申请已提交审批流程中，不需再提交，也不能修改和删除！");
		request.setAttribute("forwardLink", "leave_my?currentPage="+ currentPage);
		return "error";
	}

	public String leave_approverList() {
		User user = (User) getSession().getAttribute("user");
		String hql = "from Leave l where l.approver = '"
				+ user.getUserTrueName() + "' order by applyDate desc";
		int totalSzie = leaveService.getListSize(hql);
		this.page = new Page(currentPage, totalSzie);
		leaves = leaveService.findAllByPage(hql, currentPage, page
				.getPageSize());
		return "success";
	}
	
	public String leave_approver() {
		String approver = getRequest().getParameter("approver");
		if(approver == null || approver.equals("")) {
			leave = leaveService.findById(leaveId);
			getRequest().setAttribute("oldState", leave.getState());
			leave.setState("审批中");
			leaveService.update(leave);
			return "approver";
		}
		Date approveDate = leave.getApproveDate();
		String approveOption = leave.getApproveOption();
		String approveResult = leave.getApproveResult();
		leave = leaveService.findById(leaveId);
		leave.setApproveDate(approveDate);
		leave.setApproveOption(approveOption);
		leave.setApproveResult(approveResult);
		leave.setState("已审批");
		leaveService.update(leave);
		return "success";
	}
	public String leave_approverCancel() {
		leave = leaveService.findById(leaveId);
		leave.setState(getRequest().getParameter("oldState"));
		leaveService.update(leave);
		return "success";
	}
	public String leave_approverEnd() {
		leave = leaveService.findById(leaveId);
		leave.setState("审批完毕");
		leaveService.update(leave);
		return "success";
	}
	
	public String leave_send() {
		request = getRequest();
		leave = leaveService.findById(leaveId);
		String send = request.getParameter("send");
		if (send == null || !send.equals("send")) {
			request.setAttribute("employees", employeeService.findAll());
			return "send";
		}
		
		String approver = request.getParameter("leave.approver");
		leave.setApprover(approver);
		leave.setApproveResult(null);
		leave.setApproveOption(null);
		leave.setState("待审批");
		leaveService.update(leave);
		return "success";
	}
	public Leave getLeave() {
		return leave;
	}

	public void setLeave(Leave leave) {
		this.leave = leave;
	}

	public Integer getLeaveId() {
		return leaveId;
	}

	public void setLeaveId(Integer leaveId) {
		this.leaveId = leaveId;
	}

	public ILeaveService getLeaveService() {
		return leaveService;
	}

	@Resource
	public void setLeaveService(ILeaveService leaveService) {
		this.leaveService = leaveService;
	}

	public List<Leave> getLeaves() {
		return leaves;
	}

	public void setLeaves(List<Leave> leaves) {
		this.leaves = leaves;
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
	public IDeptService getDeptService() {
		return deptService;
	}
	@Resource
	public void setDeptService(IDeptService deptService) {
		this.deptService = deptService;
	}
	public IEmployeeService getEmployeeService() {
		return employeeService;
	}
	@Resource
	public void setEmployeeService(IEmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	public ILeaveTypeService getLeaveTypeService() {
		return leaveTypeService;
	}
	@Resource
	public void setLeaveTypeService(ILeaveTypeService leaveTypeService) {
		this.leaveTypeService = leaveTypeService;
	}
}
