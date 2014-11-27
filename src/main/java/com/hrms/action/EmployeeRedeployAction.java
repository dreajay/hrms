package com.hrms.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.hrms.model.Dept;
import com.hrms.model.Employee;
import com.hrms.model.EmployeeRedeploy;
import com.hrms.model.Post;
import com.hrms.model.RedeployType;
import com.hrms.model.User;
import com.hrms.service.IDeptService;
import com.hrms.service.IEmployeeRedeployService;
import com.hrms.service.IEmployeeService;
import com.hrms.service.IPostService;
import com.hrms.service.IRedeployTypeService;
import com.hrms.util.Page;
import com.hrms.util.StringUtil;

@Component("employeeRedeployAction")
@Scope("prototype")
public class EmployeeRedeployAction extends BaseAction {
	private static final long serialVersionUID = -2225907567820537339L;
	private Integer redeployId;
	private IEmployeeRedeployService employeeRedeployService;
	private EmployeeRedeploy employeeRedeploy;
	private List<EmployeeRedeploy> employeeRedeploys;
	private IEmployeeService employeeService;
	private Page page;
	private int currentPage = 1;
	private IDeptService deptService;
	private IPostService postService;
	private IRedeployTypeService redeployTypeService;

	public String employeeRedeploy_list() {
		int totalSzie = employeeRedeployService.getSize();
		this.page = new Page(currentPage, totalSzie);
		employeeRedeploys = employeeRedeployService.getListByPage(currentPage,
				page.getPageSize());
		return "success";
	}
	
	public String employeeRedeploy_my() {
		User user = (User)getSession().getAttribute("user");
		Integer empId = user.getEmpId();
		String hql = "from EmployeeRedeploy er where er.employee.empId = " + empId + "order by applyDate desc";
		int totalSzie = employeeRedeployService.getListSize(hql);
		this.page = new Page(currentPage, totalSzie);
		employeeRedeploys = employeeRedeployService.findAllByPage(hql, currentPage, page.getPageSize());
		return "success";
	}

	public String employeeRedeploy_detail() {
		if (redeployId != null) {
			employeeRedeploy = employeeRedeployService.findById(redeployId);
			return "success";
		} else {
			return "error";
		}
	}

	public String employeeRedeploy_add() {
		String addAction = getRequest().getParameter("addAction");
		if (addAction == null) {
			List<Dept> depts = deptService.findAll();
			List<Post> posts = postService.findAll();
			List<RedeployType> redeployTypes = redeployTypeService.findAll();
			getRequest().setAttribute("depts", depts);
			getRequest().setAttribute("posts", posts);
			getRequest().setAttribute("redeployTypes", redeployTypes);
			
			User user = (User)getSession().getAttribute("user");
			Integer empId = user.getEmpId();
			Employee employee = employeeService.findById(empId);
			
			Dept dept = employee.getDept();
			Post post = employee.getPost();
			getRequest().setAttribute("empId", empId);
			getRequest().setAttribute("empName", user.getUserTrueName());
			getRequest().setAttribute("employeeRedeploy.deployDept",dept.getDeptName());
			getRequest().setAttribute("employeeRedeploy.deployPost",post.getPostName());
			getRequest().setAttribute("employeeRedeploy.transactor",dept.getDeptMan());
			
			return "add";
		}
		String empId = getRequest().getParameter("employeeRedeploy.empId");
		Employee employee;
		if (empId != null && !empId.equals("")) {
			employee = employeeService.findById(Integer.valueOf(empId));
			employeeRedeploy.setEmployee(employee);
		} else {
			return "error";
		}
		String redeployTypeId = getRequest().getParameter(
				"employeeRedeploy.redeployTypeId");
		if (redeployTypeId != null && !redeployTypeId.equals("")) {
			employeeRedeploy.setRedeployType(redeployTypeService
					.findById(Integer.valueOf(redeployTypeId)));
		}
		String deptId = getRequest().getParameter("employeeRedeploy.deptId");
		if (deptId != null && !deptId.equals("0")) {
			employeeRedeploy.setDept(deptService.findById(Integer.valueOf(deptId)));
		} else {
			employeeRedeploy.setDept(employee.getDept());
		}
		String postId = getRequest().getParameter("employeeRedeploy.postId");
		if (postId != null && !postId.equals("0")) {
			employeeRedeploy.setPost(postService.findById(Integer.valueOf(postId)));
		} else {
			employeeRedeploy.setPost(employee.getPost());
		}
		employeeRedeployService.saveOrUpdate(employeeRedeploy);
		return "success";
	}

	public String employeeRedeploy_update() {
		employeeRedeploy = employeeRedeployService.findById(redeployId);
		String state = employeeRedeploy.getState();
		if (state == null || state.equals("未提交")) {
			String update = getRequest().getParameter("update");
			if (update != null && update.equals("update")) {
				String empId = getRequest().getParameter(
						"employeeRedeploy.empId");
				if (empId != null && !empId.equals("")) {
					employeeRedeploy.setEmployee(employeeService
							.findById(Integer.valueOf(empId)));
				} else {
					return "error";
				}
				String redeployTypeId = getRequest().getParameter(
						"employeeRedeploy.redeployTypeId");
				if (redeployTypeId != null && !redeployTypeId.equals("")) {
					employeeRedeploy.setRedeployType(redeployTypeService
							.findById(Integer.valueOf(redeployTypeId)));
				}
				String deptId = getRequest().getParameter(
						"employeeRedeploy.deptId");
				if (deptId != null && !deptId.equals("")) {
					employeeRedeploy.setDept(deptService.findById(Integer
							.valueOf(deptId)));
				}
				String postId = getRequest().getParameter(
						"employeeRedeploy.postId");
				if (postId != null && !postId.equals("")) {
					employeeRedeploy.setPost(postService.findById(Integer
							.valueOf(postId)));
				}
				employeeRedeployService.update(employeeRedeploy);
				return "success";
			} else if (redeployId != null) {
				employeeRedeploy = employeeRedeployService.findById(redeployId);
				List<Dept> depts = deptService.findAll();
				List<Post> posts = postService.findAll();
				List<RedeployType> redeployTypes = redeployTypeService
						.findAll();
				getRequest().setAttribute("depts", depts);
				getRequest().setAttribute("posts", posts);
				getRequest().setAttribute("redeployTypes", redeployTypes);
				return "update";
			} else {
				getRequest().setAttribute("errorMessage", "该申请已提交审批流程中，不需再提交，也不能修改和删除！");
				getRequest().setAttribute("forwardLink", "employeeRedeploy_my?currentPage=" + currentPage);
				return "error";
			}
		} else {
			getRequest().setAttribute("errorMessage", "该申请已提交审批流程中，不需再提交，也不能修改和删除！");
			getRequest().setAttribute("forwardLink", "employeeRedeploy_my?currentPage=" + currentPage);
			return "error";
		}
	}

	public String employeeRedeploy_delete() {
		employeeRedeploy = employeeRedeployService.findById(redeployId);
		String state = employeeRedeploy.getState();
		if (state == null || state.equals("未提交")) {
			employeeRedeployService.deleteById(getRedeployId());
			return "success";
		} else {
			getRequest().setAttribute("errorMessage", "该申请已提交审批流程中，不需再提交，也不能修改和删除！");
			getRequest().setAttribute("forwardLink", "employeeRedeploy_my?currentPage=" + currentPage);
			return "error";
			
		}
	}

	public synchronized String employeeRedeploy_submit() {
		employeeRedeploy = employeeRedeployService.findById(redeployId);
		String state = employeeRedeploy.getState();
		if (state == null || state.equals("未提交")) {
			employeeRedeploy.setTransactor(employeeRedeploy.getEmployee().getDept().getDeptMan());
			employeeRedeploy.setState("已提交");
			employeeRedeployService.update(employeeRedeploy);
			return "success";
		} else {
			return "error";
		}
	}

	public synchronized String employeeRedeploy_send() {
		employeeRedeploy = employeeRedeployService.findById(redeployId);
		String transactorOption = employeeRedeploy.getTransactorOption();
		String state = employeeRedeploy.getState();
		if (employeeRedeploy.getRedeployDate() != null) {
			getRequest().setAttribute("errorMessage", "该申请已定异动时间，不需审批和报送了！");
			return "warning";
		}
		if (state.equals("已提交") || state.equals("不同意") || state.equals("审批中")) {
			getRequest().setAttribute("errorMessage", "该申请的状态为已提交、不同意或审批中时不能报送上级！");
			return "sendError";
		}
		if (state.equals("已报送")) {
			getRequest().setAttribute("errorMessage", "该申请的状态为已报送，不需再报送了！");
			return "sendError";
		}
		if (transactorOption == null || transactorOption.equals("")) {
			return "sendError";
		}
		String send = getRequest().getParameter("send");
		if (send != null && send.equals("send")) {
			String empId = getRequest().getParameter("employeeRedeploy.empId");
			if (empId != null && !empId.equals("")) {
				String transactor = employeeService.findById(
						Integer.valueOf(empId)).getEmpName();
				state = "已报送";
				employeeRedeploy.setTransactor(transactor);
				employeeRedeploy.setState(state);
				employeeRedeployService.update(employeeRedeploy);
				return "success";
			} else {
				return "error";
			}
		} else {
			List<Employee> employees = employeeService.findAll();
			getRequest().setAttribute("employees", employees);
			return "send";
		}
	}

	public String employeeRedeploy_transactorList() {
		User user = (User) getSession().getAttribute("user");
		String transactor = user.getUserTrueName();
		String hql = "from EmployeeRedeploy where transactor='" + transactor
				+ "'";
		int totalSzie = employeeRedeployService.getListSize(hql);
		this.page = new Page(currentPage, totalSzie);
		employeeRedeploys = employeeRedeployService.findAllByPage(hql,
				currentPage, page.getPageSize());
		return "success";
	}

	public synchronized String employeeRedeploy_transactor() {
		employeeRedeploy = employeeRedeployService.findById(redeployId);
		String transactor = getRequest().getParameter("transactor");
		if (employeeRedeploy.getRedeployDate() != null) {
			return "warning";
		}
		if (transactor != null && transactor.equals("transactor")) {
			String cancel = getRequest().getParameter("cancel");
			String oldState = getRequest().getParameter("oldState");
			if (cancel != null && cancel.equals("1")) {
				employeeRedeploy.setState(StringUtil.getZhStr(oldState));
				employeeRedeployService.update(employeeRedeploy);
				return "success";
			}
			employeeRedeploy = employeeRedeployService.findById(redeployId);
			String state = getRequest().getParameter("employeeRedeploy.state");
			String transactorOption = getRequest().getParameter("employeeRedeploy.transactorOption");
			String redeployDate = getRequest().getParameter("employeeRedeploy.redeployDate");
			employeeRedeploy.setState(state);
			employeeRedeploy.setTransactorOption(transactorOption);
			employeeRedeploy.setRedeployDate(java.sql.Date.valueOf(redeployDate));
			employeeRedeployService.update(employeeRedeploy);
			return "success";
		} else {
			getRequest().setAttribute("oldState", employeeRedeploy.getState());
			employeeRedeploy.setState("审批中");
			employeeRedeployService.update(employeeRedeploy);
			return "transactor";
		}
	}

	public String employeeRedeploy_findEmployee() {
		String empIdString = getRequest().getParameter("empId");
		if (empIdString != null && !empIdString.equals("")) {
			Employee employee = employeeService.findById(Integer
					.valueOf(empIdString));
			Dept dept = employee.getDept();
			Post post = employee.getPost();
			getRequest().setAttribute("empId", empIdString);
			getRequest().setAttribute("employeeRedeploy.deployDept",
					dept.getDeptName());
			getRequest().setAttribute("employeeRedeploy.deployPost",
					post.getPostName());
		}
		List<Dept> depts = deptService.findAll();
		List<Post> posts = postService.findAll();
		List<RedeployType> redeployTypes = redeployTypeService.findAll();
		List<Employee> employees = employeeService.findAll();
		getRequest().setAttribute("depts", depts);
		getRequest().setAttribute("posts", posts);
		getRequest().setAttribute("redeployTypes", redeployTypes);
		getRequest().setAttribute("employees", employees);
		return "success";
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

	public Integer getRedeployId() {
		return redeployId;
	}

	public void setRedeployId(Integer redeployId) {
		this.redeployId = redeployId;
	}

	public IEmployeeRedeployService getEmployeeRedeployService() {
		return employeeRedeployService;
	}

	@Resource
	public void setEmployeeRedeployService(
			IEmployeeRedeployService employeeRedeployService) {
		this.employeeRedeployService = employeeRedeployService;
	}

	public List<EmployeeRedeploy> getEmployeeRedeploys() {
		return employeeRedeploys;
	}

	public void setEmployeeRedeploys(List<EmployeeRedeploy> employeeRedeploys) {
		this.employeeRedeploys = employeeRedeploys;
	}

	public EmployeeRedeploy getEmployeeRedeploy() {
		return employeeRedeploy;
	}

	public void setEmployeeRedeploy(EmployeeRedeploy employeeRedeploy) {
		this.employeeRedeploy = employeeRedeploy;
	}

	public IDeptService getDeptService() {
		return deptService;
	}

	@Resource
	public void setDeptService(IDeptService deptService) {
		this.deptService = deptService;
	}

	public IPostService getPostService() {
		return postService;
	}

	@Resource
	public void setPostService(IPostService postService) {
		this.postService = postService;
	}

	public IRedeployTypeService getRedeployTypeService() {
		return redeployTypeService;
	}

	@Resource
	public void setRedeployTypeService(IRedeployTypeService redeployTypeService) {
		this.redeployTypeService = redeployTypeService;
	}

	public IEmployeeService getEmployeeService() {
		return employeeService;
	}

	@Resource
	public void setEmployeeService(IEmployeeService employeeService) {
		this.employeeService = employeeService;
	}
}
