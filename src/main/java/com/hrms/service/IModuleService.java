package com.hrms.service;

import java.util.List;

import com.hrms.model.Module;

public interface IModuleService extends IGenericService<Module,Integer> {
	public Module getParentModule(Integer moduleId);
	public List<Module> getChildrenList(Integer moduleId);
	public String getModOrdNum(Integer parentModuleId);
	public List<Object> getAllModule();
	public boolean allModuleTreeInXml(String fileName);
	public Module getModuleByLinkUrl(String linkUrl);

}
