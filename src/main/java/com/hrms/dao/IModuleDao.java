package com.hrms.dao;

import java.io.PrintWriter;
import java.util.List;

import com.hrms.model.Module;

public interface IModuleDao extends IGenericDao<Module, Integer> {
	public Module getRootModule();
	public Module getParentModule(Integer moduleId);
	public boolean isLeaf(Integer moduleId);
	public List<Module> getChildrenModule(Integer moduleId);
	public String getModules(Integer moduleId);
	public List<Object> getSelectParentModule();
	public String getModOrdNum(Integer parentMmoduleId);
	public List<Module> getModule(String[] moduleIds);
	public boolean allModuleTreeInXml(String fileName);
	public void moduleTreeInXml(Integer moduleId,List<Module> roleModuleList,PrintWriter out);
	public Module getModuleByLinkUrl(String linkUrl);
}
