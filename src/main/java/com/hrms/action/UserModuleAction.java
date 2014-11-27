package com.hrms.action;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.hrms.model.Module;
import com.hrms.model.User;
import com.hrms.model.UserModule;
import com.hrms.service.IModuleService;
import com.hrms.service.IUserModuleService;
import com.hrms.service.IUserService;

@Component("userModuleAction")
@Scope("prototype")
public class UserModuleAction extends BaseAction {
	private static final long serialVersionUID = -4669280593329828884L;
	private IUserService userService;
	private IUserModuleService userModuleService;
	private IModuleService moduleService;
	private UserModule userModule;
	private Integer userId;
	private Module module;
	private List<Module> modules;
	private List<User> users;
	
	
	public String userModule_list() {
		if (users == null) {
			users = userService.findAll();
		}
		String fileAllModuleTreeName = getRealyPath("codebase\\allModuleTree.xml");
		String fileUserModuleTreeName = getRealyPath("codebase\\userModuleTree.xml");
		File file = new File(fileAllModuleTreeName);
		if (!file.exists()) {
			moduleService.allModuleTreeInXml(fileAllModuleTreeName);
		}
		if (userModuleService.userModuleTreeInXml(fileUserModuleTreeName, userId)) {
			return "success";
		} else {
			return "error";
		}
	}
	public String userModule_add() {
		String ms = getRequest().getParameter("moduleIdSum");
		userModuleService.addToUser(userId, ms);
		if (users == null) {
			users = userService.findAll();
		}
		String fileAllModuleTreeName = getRealyPath("codebase\\allModuleTree.xml");
		String fileUserModuleTreeName = getRealyPath("codebase\\userModuleTree.xml");
		File file = new File(fileAllModuleTreeName);
		if (!file.exists()) {
			moduleService.allModuleTreeInXml(fileAllModuleTreeName);
		}
		if (userModuleService.userModuleTreeInXml(fileUserModuleTreeName, userId)) {
			return "success";
		} else {
			return "error";
		}
	}
	public String userModule_delete() {
		String ms = getRequest().getParameter("moduleIdSum");
		userModuleService.removeFromUser(userId, ms);
		if (users == null) {
			users = userService.findAll();
		}
		String fileAllModuleTreeName = getRealyPath("codebase\\allModuleTree.xml");
		String fileUserModuleTreeName = getRealyPath("codebase\\userModuleTree.xml");
		if (moduleService.allModuleTreeInXml(fileAllModuleTreeName) && userModuleService.userModuleTreeInXml(fileUserModuleTreeName, userId)) {
			return "success";
		} else {
			return "error";
		}
	}
	
	public IUserService getUserService() {
		return userService;
	}
	@Resource
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
	public IUserModuleService getUserModuleService() {
		return userModuleService;
	}
	@Resource
	public void setUserModuleService(IUserModuleService userModuleService) {
		this.userModuleService = userModuleService;
	}
	public IModuleService getModuleService() {
		return moduleService;
	}
	@Resource
	public void setModuleService(IModuleService moduleService) {
		this.moduleService = moduleService;
	}
	public UserModule getUserModule() {
		return userModule;
	}
	public void setUserModule(UserModule userModule) {
		this.userModule = userModule;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Module getModule() {
		return module;
	}
	public void setModule(Module module) {
		this.module = module;
	}
	public List<Module> getModules() {
		return modules;
	}
	public void setModules(List<Module> modules) {
		this.modules = modules;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}

}
