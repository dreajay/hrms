package com.hrms.action;


import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.hrms.model.Role;
import com.hrms.model.User;
import com.hrms.service.IEmployeeService;
import com.hrms.service.IRoleService;
import com.hrms.service.IUserService;
import com.hrms.util.EncryptUtil;
import com.hrms.util.Page;
import com.hrms.util.StringUtil;


@Component("userAction")
@Scope("prototype")
public class UserAction extends BaseAction {
	private static final long serialVersionUID = -3938826879678966774L;
	private IUserService userService;
	private IRoleService roleService;
	private IEmployeeService employeeService;
	public IEmployeeService getEmployeeService() {
		return employeeService;
	}
	@Resource
	public void setEmployeeService(IEmployeeService employeeService) {
		this.employeeService = employeeService;
	}
	private List<User> users;
	private List<Role> roles;
	private User user;
	private Integer userId;
	private Page page;
	private int currentPage=1;
	
	public String user_login() throws Exception{
		String userName = user.getUserName();
		String userPassword = user.getUserPassword();
		if(userName != null && !userName.equals("")) {
			User u = userService.findByName(userName);
			String pass = u.getUserPassword();
			pass = EncryptUtil.dencryptStringByDES(pass, EncryptUtil.defaultKey);
			if(u == null || u.equals("")) {
				this.addFieldError("user.userName", "用户不正确，请重新输入");
				return "loginError";
			} else if(!pass.equals(userPassword)) {
				this.addFieldError("user.userPassword", "密码不正确，请重新输入");
				return "loginError";
			} else {
				getSession().setAttribute("user", u);
				getSession().setAttribute("userId", u.getUserId());
				getSession().setAttribute("userName",userName);
				return "success";
			}
		} else {
			return "input";
		}
	}
	public String user_loginOut() throws Exception{
		getSession().setAttribute("user", null);
		getSession().removeAttribute("user");
		getSession().removeAttribute("userId");
		getSession().removeAttribute("userName");
		return "success";
	}
	
	public String user_list() {
		int totalSzie = userService.getSize();
		this.page = new Page(currentPage, totalSzie);
		//this.users = userService.getListByPageByDesc(currentPage, page.getPageSize(),"userId");
		users = userService.getListByPage(currentPage, page.getPageSize());
		roles = roleService.findAll();
		getRequest().setAttribute("roles", roles);
		return "success";
	}
	public String user_detail() {
		if(userId != null) {
			user = userService.findById(userId);
			getRequest().setAttribute("employee", employeeService.findById(user.getEmpId()));
			return "success";
		}
		return "error";
	}
	public String user_add() throws Exception{
		HttpServletRequest request =  getRequest();
		roles = roleService.findAll();
		request.setAttribute("roles", roles);
		String addAction = request.getParameter("addAction");
		String empId = request.getParameter("empId");
		String empName = request.getParameter("empName");
		request.setAttribute("empId", empId);
		request.setAttribute("empName", StringUtil.getZhStr(empName, "UTF-8"));
		if (addAction==null && addAction != "2") {
			user = null;
			if (empId == null || empName == null) {
				return "error";
			}
			return "add";
		}
		String adds = request.getParameter("add");
		user.setCreateDate(new Date());
		user.setEmpId(Integer.valueOf(empId));
		user.setUserPassword(EncryptUtil.encryptStringByDES(user.getUserPassword(), EncryptUtil.defaultKey));
		User u = userService.findByName(user.getUserName());
		if(u == null || u.equals("")) {
			String[] addRoleId = request.getParameterValues("roleId");
			if (addRoleId!=null && addRoleId.length>0) {
				Set<Role> userRoles = new HashSet<Role>();
				for (int i = 0; i < addRoleId.length; i++) {
					Role role =  roleService.findById(Integer.valueOf(addRoleId[i]));
					if (role!=null) {
						userRoles.add(role);
					}
				}
				if (userRoles.size()>0) {
					user.setRoles(userRoles);
				}
			}
			User uTrue = userService.findByTrueName(user.getUserTrueName());
			if (uTrue != null) {
				Integer uTrueUserId = uTrue.getUserId();
				uTrue = user;
				uTrue.setUserId(uTrueUserId);
				userService.saveOrUpdate(uTrue);
			} else {
				userService.saveOrUpdate(user);
			}
			if(adds!=null && adds.equals("2")) {
				return "user_adds";
			}
			return "success";
		} else {
			this.addFieldError("user.userName", "用户名已存在");
			return "error";
		}
		
	}
	public String user_update() throws Exception{
		HttpServletRequest request =  getRequest();
		String update = request.getParameter("update");
		Set<Role> userRoles;
		if(update!= null && update.equals("update") && userId != null) {
			if (!getRequest().getParameter("oldUser").equals(user.getUserName())) {
				User exist = userService.findByName(user.getUserName());
				if(exist != null) {
					roles = roleService.findAll();
					user = userService.findById(userId);
					userRoles = user.getRoles();
					request.setAttribute("userRoles", userRoles);
					this.addFieldError("user.userName", "用户名已存在");
					return "error";
				}
			}
			User u = userService.findById(userId);
			u.setUserName(user.getUserName());
			u.setUserTrueName(user.getUserTrueName());
			u.setUserPassword(EncryptUtil.encryptStringByDES(user.getUserPassword(), EncryptUtil.defaultKey));
			userRoles = u.getRoles();
			if (userRoles!=null&&userRoles.size()>0) {
				userRoles.clear();
			}
			String[] addRoleId = request.getParameterValues("select2");
			if (addRoleId!=null&&addRoleId.length>0) {
				for (int i = 0; i < addRoleId.length; i++) {
					Role role =  roleService.findById(Integer.valueOf(addRoleId[i]));
					userRoles.add(role);
				}
			}
			if (userRoles!=null&&userRoles.size()>0) {
				u.setRoles(userRoles);
			}
			userService.update(u);
			return "success";
		}else {
			roles = roleService.findAll();
			user = userService.findById(userId);
			user.setUserPassword(EncryptUtil.dencryptStringByDES(user.getUserPassword(), EncryptUtil.defaultKey));
			userRoles = user.getRoles();
			request.setAttribute("userRoles", userRoles);
			return "user_update";
		}
	}
	public String user_delete() throws Exception{
		userService.deleteById(userId);
		return "success";
	}

	
	
	public IUserService getUserService() {
		return userService;
	}
	@Resource
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
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
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	public IRoleService getRoleService() {
		return roleService;
	}
	@Resource
	public void setRoleService(IRoleService roleService) {
		this.roleService = roleService;
	}
}
