package com.hrms.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.hrms.model.Module;
import com.hrms.service.IModuleService;
import com.hrms.service.IUserModuleService;
import com.hrms.util.Page;

@Component("moduleAction")
@Scope("prototype")
public class ModuleAction extends BaseAction {
	private static final long serialVersionUID = 464040703069389430L;
	private IModuleService moduleService;
	private IUserModuleService userModuleService;
	private Integer userId;
	private Module module;
	private Module rootModule;
	private Integer moduleId;
	private List<Module> modules;
	private String leftModuleTree;
	private Page page;
	private int currentPage=1;
	
	
	public String module_xmlTree() {
		String fileName = getRealyPath("codebase\\allModuleTree.xml");
		if (moduleService.allModuleTreeInXml(fileName)) {
			return "success";
		} else {
			return "error";
		}
	}
	public String moduleTree() {
		userId = (Integer) getSession().getAttribute("userId");
		String[] userModuleIdSum = userModuleService.getUserModuleIdSum(userId);
		leftModuleTree = userModuleService.getUserModuleTree(userModuleIdSum);
		//System.out.println(leftModuleTree);
		return "success";
	}
	public String module_list() {
		int totalSzie = moduleService.getSize();
		this.page = new Page(currentPage, totalSzie);
		page.setPageSize(totalSzie);
		modules = moduleService.getListByPage(currentPage, totalSzie);
		getSession().setAttribute("modules", modules);
		return "success";
	}
	public String all_module() {
		return "success";
	}
	public String module_add() throws Throwable {
		String addAction = getRequest().getParameter("addAction");
		if (addAction==null && addAction != "2") {
			modules = moduleService.findAll();
			return "add";
		}
		Integer parentModuleId = moduleId;
		module.setParentModuleId(parentModuleId);
		String moduleOrderNum = moduleService.getModOrdNum(parentModuleId);
		module.setModuleOrderNum(moduleOrderNum);
		//System.out.println(moduleOrderNum);
		module.setModuleId(null);
		moduleService.saveOrUpdate(module);
		return "success";
	}
	public String module_adds() throws Throwable {
		modules = moduleService.findAll();
		Integer parentModuleId = moduleId;
		module.setParentModuleId(parentModuleId);
		String moduleOrderNum = moduleService.getModOrdNum(parentModuleId);
		module.setModuleOrderNum(moduleOrderNum);
		module.setModuleId(null);
		addActionMessage("添加成功");
		moduleService.saveOrUpdate(module);
		return "success";
	}
	public String module_update() throws Throwable {
		modules = moduleService.findAll();
		String update = getRequest().getParameter("update");
		if(update!= null && update.equals("update") && moduleId != null) {
			String selectId = getRequest().getParameter("select");
			Integer parentModuleId = Integer.valueOf(selectId);
			if (!parentModuleId.equals(module.getParentModuleId())) {
				module.setParentModuleId(parentModuleId);
				String moduleOrderNum = moduleService.getModOrdNum(parentModuleId);
				module.setModuleOrderNum(moduleOrderNum);
			}
			module.setModuleId(moduleId);
			moduleService.update(module);
			return "success";
		}else {
			module = moduleService.findById(moduleId);
			for (int i = 0; i < modules.size(); i++) {
				if(moduleId.equals(modules.get(i).getModuleId()))
					modules.remove(i);
			}
			return "module_update";
		}
	}
	public String module_delete() throws Throwable {
		moduleService.deleteById(moduleId);
		return "success";
	}
	public IModuleService getModuleService() {
		return moduleService;
	}
	@Resource
	public void setModuleService(IModuleService moduleService) {
		this.moduleService = moduleService;
	}
	public Integer getModuleId() {
		return moduleId;
	}

	public void setModuleId(Integer moduleId) {
		this.moduleId = moduleId;
	}
	public List<Module> getModules() {
		return modules;
	}
	public void setModules(List<Module> modules) {
		this.modules = modules;
	}
	public Module getRootModule() {
		return rootModule;
	}

	public void setRootModule(Module rootModule) {
		this.rootModule = rootModule;
	}
	public String getLeftModuleTree() {
		return leftModuleTree;
	}
	public void setLeftModuleTree(String leftModuleTree) {
		this.leftModuleTree = leftModuleTree;
	}
	public IUserModuleService getUserModuleService() {
		return userModuleService;
	}
	@Resource
	public void setUserModuleService(IUserModuleService userModuleService) {
		this.userModuleService = userModuleService;
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
}
