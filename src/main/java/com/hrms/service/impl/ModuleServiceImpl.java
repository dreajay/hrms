package com.hrms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hrms.dao.IModuleDao;
import com.hrms.model.Module;
import com.hrms.service.IModuleService;

@Service("moduleService")
public class ModuleServiceImpl extends GenericServiceImpl<Module, Integer> implements IModuleService {
	
	private IModuleDao moduleDao;
	
	public IModuleDao getModuleDao() {
		return moduleDao;
	}
	public Module getModuleByLinkUrl(String linkUrl) {
		return moduleDao.getModuleByLinkUrl(linkUrl);
	}
	public boolean allModuleTreeInXml(String fileName) {
		return moduleDao.allModuleTreeInXml(fileName);
	}
	public List<Module> getChildrenList(Integer moduleId) {
		return moduleDao.getChildrenModule(moduleId);
	}
	public Module getParentModule(Integer moduleId) {
		return moduleDao.getParentModule(moduleId);
	}
	public String getModOrdNum(Integer parentModuleId) {
		return moduleDao.getModOrdNum(parentModuleId);
	}
	public List<Object> getAllModule() {
		return moduleDao.getSelectParentModule();
	}
	@Resource
	public void setModuleDao(IModuleDao moduleDao) {
		this.moduleDao = moduleDao;
	}
}
