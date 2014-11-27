package com.hrms.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.hrms.model.Dept;
import com.hrms.model.Employee;
import com.hrms.service.IDeptService;
import com.hrms.service.IEmployeeService;
import com.hrms.util.Page;


@Component("deptAction")
@Scope("prototype")
public class DeptAction extends BaseAction {
	private static final long serialVersionUID = 3927204414255792182L;
	private Dept dept;
	private Dept parentDept;
	private Integer deptId;
	private List<Dept> depts;
	private IDeptService deptService;
	private IEmployeeService employeeService;
	private Page page;
	private int currentPage=1;
	
	public String dept_list() {
		int totalSzie = deptService.getSize();
		this.page = new Page(currentPage, totalSzie);
		depts = deptService.getListByPage(currentPage, page.getPageSize());
		getSession().setAttribute("depts", depts);
		return "success";
	}
	public String dept_add() {
		String addAction = getRequest().getParameter("addAction");
		if (addAction==null) {
			List<Employee> employees = employeeService.findAll();
			getRequest().setAttribute("employees", employees);
			return "add";
		}
		Integer parentDeptId = deptId;
		dept.setDeptId(null);
		dept.setParentDept(deptService.findById(parentDeptId));
		deptService.saveOrUpdate(dept);
		if(addAction!=null && addAction.equals("2")) {
			return "adds";
		} 
		return "success";
	}
	public String dept_update() {
		String update = getRequest().getParameter("update");
		if(update != null && update.equals("update")) {
			String selParentDeptId = getRequest().getParameter("selParentDept");
			Integer parentDeptId;
			if (selParentDeptId != null && !selParentDeptId.equals("")) {
				parentDeptId= Integer.valueOf(selParentDeptId);
				dept.setParentDept(deptService.findById(parentDeptId));
			}
			deptService.update(dept);
			return "success";
		}else if(deptId != null) {
			List<Employee> employees = employeeService.findAll();
			getRequest().setAttribute("employees", employees);
			dept = deptService.findById(deptId);
			String deptMan = dept.getDeptMan();
			getRequest().setAttribute("deptMan", deptMan);
			parentDept = dept.getParentDept();
			return "update";
		} else {
			return "error";
		}
		
	}
	public String dept_delete() {
		deptService.deleteById(getDeptId());
		return "success";
	}
	
	public Dept getDept() {
		return dept;
	}
	public void setDept(Dept dept) {
		this.dept = dept;
	}
	public List<Dept> getDepts() {
		return depts;
	}
	public void setDepts(List<Dept> depts) {
		this.depts = depts;
	}
	public IDeptService getDeptService() {
		return deptService;
	}
	@Resource
	public void setDeptService(IDeptService deptService) {
		this.deptService = deptService;
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
	public Integer getDeptId() {
		return deptId;
	}
	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}
	public Dept getParentDept() {
		return parentDept;
	}
	public void setParentDept(Dept parentDept) {
		this.parentDept = parentDept;
	}
	public IEmployeeService getEmployeeService() {
		return employeeService;
	}
	@Resource
	public void setEmployeeService(IEmployeeService employeeService) {
		this.employeeService = employeeService;
	}
}
