package com.hrms.action;


import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.hrms.model.Action;
import com.hrms.model.Module;
import com.hrms.model.Role;
import com.hrms.model.RolePermission;
import com.hrms.model.User;
import com.hrms.service.IActionService;
import com.hrms.service.IModuleService;
import com.hrms.service.IRolePermissionService;
import com.hrms.service.IRoleService;
import com.hrms.service.IUserPermissionService;
import com.hrms.service.IUserService;

@Component("permissionAction")
@Scope("prototype")
public class PermissionAction extends BaseAction {
	private static final long serialVersionUID = 1429111948547647917L;
	private IRolePermissionService rolePermissionService;
	private IUserPermissionService userPermissionService;
	private IModuleService moduleService;
	private List<Module> modules;
	private IActionService actionService;
	private List<Action> actions;
	private Action action;
	private IRoleService roleService;
	private Integer roleId;
	private Role role;
	private List<Role> roles;
	private User user;
	private Integer userId;
	private IUserService userService;
	private List<User> users;
	private List<RolePermission> rolePermissions;

	public String permission_list() {
		modules = moduleService.findAll();
		actions = actionService.findAll();
		String roleIdString = getRequest().getParameter("roleId");
		if (roleIdString!=null && roleIdString!="" && roleIdString!="1") {
			roles = roleService.findAll();
			roleId = Integer.valueOf(roleIdString);
			users = new ArrayList<User>(roleService.findById(roleId).getUsers());
			return "success";
		}
		String userIdString = getRequest().getParameter("userId");
		if (userIdString != null && userIdString!= "") {
			users = userService.findAll();
			userId = Integer.valueOf(userIdString);
			user = userService.findById(userId);
			roles = new ArrayList<Role>(user.getRoles());
			return "success";
		}
		return "success";
	}
	public String userPermission_list() {
		String userIdString = getRequest().getParameter("userId");
		if (userIdString!=null && userIdString != "") {
			userId = Integer.valueOf(userIdString);
			user = userService.findById(userId);
			getRequest().setAttribute("userRoles", user.getRoles());
		}
		rolePermissions = rolePermissionService.findAll();
		modules = moduleService.findAll();
		actions = actionService.findAll();
		
		return "success";
	}
	public String userPermission_updateAll() {
		String userIdsString = getRequest().getParameter("userId");
		if (userIdsString!=null && userIdsString != "") {
			userId = Integer.valueOf(userIdsString);
			user = userService.findById(userId);
		}
		actions = actionService.findAll();
		String actionIds= actions.get(0).getActionId().toString();
		for (int i = 1; i < actions.size(); i++) {
			actionIds = actionIds + "," + actions.get(i).getActionId();
		}
		String mp = getRequest().getParameter("mp");
		String[] mpsString = mp.split(","); 
		for (int i = 0; i <mpsString.length; i++) {
			int a = mpsString[i].indexOf("/");
			String moduleId = mpsString[i].substring(0,a).trim();
			String actionIdsString = mpsString[i].substring(a+1);
			String permission = actionIdsString.replace("/", ",");
			userPermissionService.saveOrUpdate(Integer.valueOf(userId), Integer.valueOf(moduleId), actionIds, permission);	
		}
		getRequest().setAttribute("userId", userId);
		return "success";
	}
	public String userPermission_update() {
		String userIdsString = getRequest().getParameter("userId");
		if (userIdsString!=null && userIdsString != "") {
			userId = Integer.valueOf(userIdsString);
			user = userService.findById(userId);
		}
		String moduleId = getRequest().getParameter("moduleId");
		String permission = getRequest().getParameter("permission");
		actions = actionService.findAll();
		String actionIds= actions.get(0).getActionId().toString();
		for (int i = 1; i < actions.size(); i++) {
			actionIds = actionIds + "," + actions.get(i).getActionId();
			
		}
		userPermissionService.saveOrUpdate(Integer.valueOf(userId), Integer.valueOf(moduleId), actionIds, permission);
		getRequest().setAttribute("userId", userId);
		return "success";
	}
	public boolean userPermission_checked(Integer userId,Integer moduleId,Integer actionId) {
		return userPermissionService.checked(userId, moduleId, actionId);
	}
	public String rolePermission_list(){
		rolePermissions = rolePermissionService.findAll();
		modules = moduleService.findAll();
		actions = actionService.findAll();
		roles = roleService.findAll();
		String roleIdString = getRequest().getParameter("roleId");
		if (roleIdString!=null && roleIdString!="" && roleIdString!="1") {
			roleId = Integer.valueOf(roleIdString);
		}
		return "success";
	}
	public String rolePermission_updateAll() {
		String roleId = getRequest().getParameter("roleId");
		getRequest().setAttribute("roleId", roleId);
		actions = actionService.findAll();
		String actionIds= actions.get(0).getActionId().toString();
		for (int i = 1; i < actions.size(); i++) {
			actionIds = actionIds + "," + actions.get(i).getActionId();
		}
		String mp = getRequest().getParameter("mp");
		String[] mpsString = mp.split(","); 
		for (int i = 0; i <mpsString.length; i++) {
			int a = mpsString[i].indexOf("/");
			String moduleId = mpsString[i].substring(0,a).trim();
			String actionIdsString = mpsString[i].substring(a+1);
			String permission = actionIdsString.replace("/", ",");
			rolePermissionService.saveOrUpdate(Integer.valueOf(roleId), Integer.valueOf(moduleId), actionIds, permission);	
		}
		return "success";
	}
	
	public String rolePermission_update() {
		String roleId = getRequest().getParameter("roleId");
		String moduleId = getRequest().getParameter("moduleId");
		String permission = getRequest().getParameter("permission");
		actions = actionService.findAll();
		String actionIds= actions.get(0).getActionId().toString();
		for (int i = 1; i < actions.size(); i++) {
			actionIds = actionIds + "," + actions.get(i).getActionId();
			
		}
		rolePermissionService.saveOrUpdate(Integer.valueOf(roleId), Integer.valueOf(moduleId), actionIds, permission);
		getRequest().setAttribute("roleId", roleId);
		return "success";
	}
	public boolean rolePermission_checked(Integer roleId,Integer moduleId,Integer actionId) {
		return rolePermissionService.checked(roleId, moduleId, actionId);
	}
	public static boolean ss() {
		return true;
	}
	public List<Module> getModules() {
		return modules;
	}
	
	public void setModules(List<Module> modules) {
		this.modules = modules;
	}

	public List<Action> getActions() {
		return actions;
	}

	public void setActions(List<Action> actions) {
		this.actions = actions;
	}

	public Action getAction() {
		return action;
	}

	public void setAction(Action action) {
		this.action = action;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}
	public IModuleService getModuleService() {
		return moduleService;
	}
	@Resource
	public void setModuleService(IModuleService moduleService) {
		this.moduleService = moduleService;
	}
	public IActionService getActionService() {
		return actionService;
	}
	@Resource
	public void setActionService(IActionService actionService) {
		this.actionService = actionService;
	}
	public IRoleService getRoleService() {
		return roleService;
	}
	@Resource
	public void setRoleService(IRoleService roleService) {
		this.roleService = roleService;
	}
	public IRolePermissionService getRolePermissionService() {
		return rolePermissionService;
	}
	@Resource
	public void setRolePermissionService(
			IRolePermissionService rolePermissionService) {
		this.rolePermissionService = rolePermissionService;
	}
	public List<RolePermission> getRolePermissions() {
		return rolePermissions;
	}
	public void setRolePermissions(List<RolePermission> rolePermissions) {
		this.rolePermissions = rolePermissions;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
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
	public IUserService getUserService() {
		return userService;
	}
	@Resource
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	public IUserPermissionService getUserPermissionService() {
		return userPermissionService;
	}
	@Resource
	public void setUserPermissionService(
			IUserPermissionService userPermissionService) {
		this.userPermissionService = userPermissionService;
	}
	public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}

}
