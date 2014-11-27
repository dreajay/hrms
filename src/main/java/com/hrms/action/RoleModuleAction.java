package com.hrms.action;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.hrms.model.Module;
import com.hrms.model.Role;
import com.hrms.model.RoleModule;
import com.hrms.service.IModuleService;
import com.hrms.service.IRoleModuleService;
import com.hrms.service.IRoleService;

@Component("roleModuleAction")
@Scope("prototype")
public class RoleModuleAction extends BaseAction {
	private static final long serialVersionUID = -5611182138441558500L;
	private IRoleService roleService;
	private IRoleModuleService roleModuleService;
	private IModuleService moduleService;
	private RoleModule roleModule;
	private Integer roleId;
	private Module module;
	private List<Module> modules;
	private List<Role> roles;
	private String roleModuleTree;
	
	public String roleModule_list() {
		if (roles == null) {
			roles = roleService.findAll();
		}
		String fileAllModuleTreeName = getRealyPath("codebase\\allModuleTree.xml");
		String fileRoleModuleTreeName = getRealyPath("codebase\\roleModuleTree.xml");
		if (moduleService.allModuleTreeInXml(fileAllModuleTreeName) && roleModuleService.roleModuleTreeInXml(fileRoleModuleTreeName, roleId)) {
			return "success";
		} else {
			return "error";
		}
	}
	public String roleModule_add() {
		String ms = getRequest().getParameter("moduleIdSum");
		roleModuleService.addToRole(roleId, ms);
		if (roles == null) {
			roles = roleService.findAll();
		}
		String fileAllModuleTreeName = getRealyPath("codebase\\allModuleTree.xml");
		String fileRoleModuleTreeName = getRealyPath("codebase\\roleModuleTree.xml");
		File file = new File(fileAllModuleTreeName);
		if (!file.exists()) {
			moduleService.allModuleTreeInXml(fileAllModuleTreeName);
		}
		if (roleModuleService.roleModuleTreeInXml(fileRoleModuleTreeName, roleId)) {
			return "success";
		} else {
			return "error";
		}
	}
	public String roleModule_delete() {
		String ms = getRequest().getParameter("moduleIdSum");
		roleModuleService.removeFromRole(roleId, ms);
		if (roles == null) {
			roles = roleService.findAll();
		}
		String fileAllModuleTreeName = getRealyPath("codebase\\allModuleTree.xml");
		String fileRoleModuleTreeName = getRealyPath("codebase\\roleModuleTree.xml");
		File file = new File(fileAllModuleTreeName);
		if (!file.exists()) {
			moduleService.allModuleTreeInXml(fileAllModuleTreeName);
		}
		if (roleModuleService.roleModuleTreeInXml(fileRoleModuleTreeName, roleId)) {
			return "success";
		} else {
			return "error";
		}
	}
	public String roleModuleId() {
		roleModule.getRoleModuleId();
		return "success";
	}
	
	public List<Module> getModules() {
		return modules;
	}
	public void setModules(List<Module> modules) {
		this.modules = modules;
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
	public RoleModule getRoleModule() {
		return roleModule;
	}
	public void setRoleModule(RoleModule roleModule) {
		this.roleModule = roleModule;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public Module getModule() {
		return module;
	}
	public void setModule(Module module) {
		this.module = module;
	}
	public String getRoleModuleTree() {
		return roleModuleTree;
	}

	public void setRoleModuleTree(String roleModuleTree) {
		this.roleModuleTree = roleModuleTree;
	}
	public IRoleModuleService getRoleModuleService() {
		return roleModuleService;
	}
	@Resource
	public void setRoleModuleService(IRoleModuleService roleModuleService) {
		this.roleModuleService = roleModuleService;
	}
	public IModuleService getModuleService() {
		return moduleService;
	}
	@Resource
	public void setModuleService(IModuleService moduleService) {
		this.moduleService = moduleService;
	}
}
