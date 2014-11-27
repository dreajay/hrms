package com.hrms.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.hrms.model.Dept;
import com.hrms.model.Employee;
import com.hrms.model.EmployeeState;
import com.hrms.model.Post;
import com.hrms.model.User;
import com.hrms.service.IDeptService;
import com.hrms.service.IEmployeeService;
import com.hrms.service.IEmployeeStateService;
import com.hrms.service.IPostService;
import com.hrms.service.IUserService;
import com.hrms.util.Page;


@Component("employeeAction")
@Scope("prototype")
public class EmployeeAction extends BaseAction {
	private static final long serialVersionUID = -417086942583335243L;
	private Integer empId;
	private Employee employee;
	private List<Employee> employees;
	private IEmployeeService employeeService;
	private IDeptService deptService;
	private IPostService postService;
	private IEmployeeStateService employeeStateService;
	private IUserService userService;
	private Page page;
	private int currentPage=1;
	
	public String employee_list() {
		int totalSzie = employeeService.getSize();
		this.page = new Page(currentPage, totalSzie);
		employees = employeeService.getListByPage(currentPage, page.getPageSize());
		getSession().setAttribute("employee", employee);
		return "success";
	}
	public String employee_detail() {
		if(empId != null) {
			employee = employeeService.findById(empId);
			return "success";
		} else {
			return "error";
		}
	}
	public String employee_add() {
		String addAction = getRequest().getParameter("addAction");
		if (addAction==null) {
			List<Dept> depts = deptService.findAll();
			List<Post> posts = postService.findAll();
			List<EmployeeState> employeeStates = employeeStateService.findAll();
			getRequest().setAttribute("depts", depts);
			getRequest().setAttribute("posts", posts);
			getRequest().setAttribute("employeeStates", employeeStates);
			return "add";
		}
		//employee.setEmpId(null);
		String deptId = getRequest().getParameter("deptId");
		if (deptId != null && !deptId.equals("")) {
			employee.setDept(deptService.findById(Integer.valueOf(deptId)));
		}
		String postId = getRequest().getParameter("postId");
		if (postId != null && !postId.equals("")) {
			employee.setPost(postService.findById(Integer.valueOf(postId)));
		}
		String employeeStateId = getRequest().getParameter("employeeStateId");
		if (employeeStateId != null && !employeeStateId.equals("")) {
			employee.setEmployeeState(employeeStateService.findById(Integer.valueOf(employeeStateId)));
		}
		employeeService.saveOrUpdate(employee);
		if(addAction!=null && addAction.equals("2")) {
			List<Dept> depts = deptService.findAll();
			List<Post> posts = postService.findAll();
			List<EmployeeState> employeeStates = employeeStateService.findAll();
			getRequest().setAttribute("depts", depts);
			getRequest().setAttribute("posts", posts);
			getRequest().setAttribute("employeeStates", employeeStates);
			return "adds";
		} 
		return "success";
	}
	public String employee_update() {
		String update = getRequest().getParameter("update");
		if(update != null && update.equals("update")) {
			String deptId = getRequest().getParameter("deptId");
			if (deptId != null && !deptId.equals("")) {
				employee.setDept(deptService.findById(Integer.valueOf(deptId)));
			}
			String postId = getRequest().getParameter("postId");
			if (postId != null && !postId.equals("")) {
				employee.setPost(postService.findById(Integer.valueOf(postId)));
			}
			String employeeStateId = getRequest().getParameter("employeeStateId");
			if (employeeStateId != null && !employeeStateId.equals("")) {
				employee.setEmployeeState(employeeStateService.findById(Integer.valueOf(employeeStateId)));
			}
			employeeService.update(employee);
			List<User> users = userService.findByHql("from User u where u.empId=" + employee.getEmpId());
			if(users != null && users.size() > 0) {
				for (int j = 0; j < users.size(); j++) {
					User user = users.get(j);
					user.setUserTrueName(employee.getEmpName());
					userService.update(user);
				}
			}
			return "success";
		}else if(empId != null) {
			List<Dept> depts = deptService.findAll();
			List<Post> posts = postService.findAll();
			List<EmployeeState> employeeStates = employeeStateService.findAll();
			getRequest().setAttribute("depts", depts);
			getRequest().setAttribute("posts", posts);
			getRequest().setAttribute("employeeStates", employeeStates);
			employee = employeeService.findById(empId);
			return "update";
		} else {
			return "error";
		}
		
	}
	public String employee_delete() {
		employeeService.deleteById(getEmpId());
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
	public Integer getEmpId() {
		return empId;
	}
	public void setEmpId(Integer empId) {
		this.empId = empId;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public List<Employee> getEmployees() {
		return employees;
	}
	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
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
	public IPostService getPostService() {
		return postService;
	}
	@Resource
	public void setPostService(IPostService postService) {
		this.postService = postService;
	}
	public IEmployeeStateService getEmployeeStateService() {
		return employeeStateService;
	}
	@Resource
	public void setEmployeeStateService(IEmployeeStateService employeeStateService) {
		this.employeeStateService = employeeStateService;
	}
	public IUserService getUserService() {
		return userService;
	}
	@Resource
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
}
