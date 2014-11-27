package com.hrms.dao.impl;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.hrms.dao.IModuleDao;
import com.hrms.dao.IRoleDao;
import com.hrms.dao.IRoleModuleDao;
import com.hrms.model.Module;
import com.hrms.model.Role;
import com.hrms.model.RoleModule;

@Repository("roleModuleDao")
public class RoleModuleDaoImpl extends GenericDaoImpl<RoleModule, Integer> implements
		IRoleModuleDao {
	private IModuleDao moduleDao;
	private IRoleDao roleDao;
	public boolean addToRole(Integer roleId,String moduleIdSum) {
		if (roleId!=null && roleId>0 && moduleIdSum!=null && !moduleIdSum.equals("")) {
			RoleModule roleModule = getRoleModuleByRoleId(roleId);
			if (roleModule!=null) {
				String[] moduleIdSumArray = moduleIdSum.split(",");
				List<String> list = new LinkedList<String>();
				String[] sIdSum = getRoleModuleId(roleId);
				if (sIdSum!=null&&sIdSum.length>0) {
					for (int i = 0; i < sIdSum.length; i++) {
				            if(!list.contains(sIdSum[i])) {
				                list.add(sIdSum[i]);
				            }
					}
					
				}
				for (int j = 0; j < moduleIdSumArray.length; j++) {
		            if(!list.contains(moduleIdSumArray[j])) {
		                list.add(moduleIdSumArray[j]);
		            }	
				}
				if (list.size()>sIdSum.length) {
					String[] newrIdSumArray = (String[])list.toArray(new String[list.size()]);
					String newrIdSum="1";
					for (int i = 0; i < newrIdSumArray.length; i++) {
						newrIdSum = newrIdSum + "," +newrIdSumArray[i];
					}
					newrIdSum = newrIdSum.substring(2);
					roleModule.setModuleSum(newrIdSum);
					return this.update(roleModule);
				}
			}else {
				roleModule = new RoleModule();
				Role role = roleDao.findById(roleId);
				roleModule.setRole(role);
				roleModule.setModuleSum(moduleIdSum);
				return this.save(roleModule);
			}
			
		}
		return false;
	}
	
	public boolean removeFromRole(Integer roleId, String moduleIdSum) {
		if (roleId!=null && roleId>0 && moduleIdSum!=null && !moduleIdSum.equals("")) {
			RoleModule roleModule = getRoleModuleByRoleId(roleId);
			if (roleModule!=null) {
				List<String> list = new LinkedList<String>();
				String[] roleModuleIdSum = getRoleModuleId(roleId);
				String[] moduleIdSumArray = moduleIdSum.split(",");
				if (roleModuleIdSum!=null && roleModuleIdSum.length>0) {
					for (int i = 0; i < roleModuleIdSum.length; i++) {
			            if(!list.contains(roleModuleIdSum[i])) {
			                list.add(roleModuleIdSum[i]);
			            }
					}
				}
				for (int j = 0; j < moduleIdSumArray.length; j++) {
					if (list.contains(moduleIdSumArray[j])) {
						list.remove(moduleIdSumArray[j]);
					}
				}
				if (list.size()<roleModuleIdSum.length) {
					String[] newrIdSumArray = (String[])list.toArray(new String[list.size()]);
					String newrIdSum="1";
					for (int i = 0; i < newrIdSumArray.length; i++) {
						newrIdSum = newrIdSum + "," +newrIdSumArray[i];
					}
					if (newrIdSum.length()>2) {
						newrIdSum = newrIdSum.substring(2);
					}
					roleModule.setModuleSum(newrIdSum);
					return this.update(roleModule);
				}
			}
		}
		return false;
	}
	@SuppressWarnings("unchecked")
	public RoleModule getRoleModuleByRoleId(Integer roleId) {
		List<RoleModule> list = getHibernateTemplate().find("from RoleModule where roleId=?",roleId);
		if (list!=null && list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	public boolean roleModuleTreeInXml(String fileName,Integer roleId) {
		
        File file = new File(fileName);   
        try {   
            PrintWriter out = new PrintWriter(file,"UTF-8");
            out.println("<?xml version='1.0' encoding='UTF-8'?>");
            out.println("<tree id=\"0\">");
            out.println("<item text=\""+moduleDao.getRootModule().getModuleName()+"\" id=\""+moduleDao.getRootModule().getModuleId()+"\" open=\"1\" im0=\"tombs.gif\" im1=\"tombs.gif\" im2=\"iconSafe.gif\" call=\"1\" select=\"1\">");
            if (roleId!=null && roleId>=0) {
            	List<Module> roleModuleList = getRoleModule(roleId);
            	if (roleModuleList!=null && roleModuleList.size()>0) {
            		for (int i = 0; i < roleModuleList.size(); i++) {
                    	moduleDao.moduleTreeInXml(roleModuleList.get(i).getModuleId(),roleModuleList, out);
        			}
				}
			}
            out.println("</item>");
            out.println("</tree>");
            out.flush();    
            out.close();
            if (file.exists()) {
            	 return true;
			}else {
				 return false;
			}
           
        } catch (IOException e) {   
            System.out.println("moduleTree to xml got a exception!");   
            e.printStackTrace(); 
            return false;
        }   

		
	}
	
	public List<Module> getRoleModule(Integer roleId) {
		String[] s = getRoleModuleId(roleId);
		if (s!=null && s.length>0) {
			return moduleDao.getModule(s);
		}
		return null;
	}
	
	public String getRoleModuleTree(Integer roleId) {
		String[] roleModuleIdSum = getRoleModuleId(roleId);
		if(roleModuleIdSum != null && roleModuleIdSum.length>0) {
			StringBuffer leftModuleTree = new StringBuffer();
			leftModuleTree.append("<script type=text/javascript>")
			.append("var tree = null;")
			.append("var root = new TreeNode('" + moduleDao.getRootModule().getModuleName() + "');");
			for(int i=0;i<roleModuleIdSum.length;i++){
				leftModuleTree.append(moduleDao.getModules(Integer.valueOf(roleModuleIdSum[i])));
			}
			leftModuleTree.append("tree = new Tree(root);")
			.append("tree.show('menuTree');")
			.append("</script>");
			return leftModuleTree.toString();
		} else {
			return "this role have no menu ";
		}
	}
	
	@SuppressWarnings("unchecked")
	public String[] getRoleModuleId(Integer roleId) {
		if (roleId!=null) {
			List<RoleModule> list = this.getHibernateTemplate().find("from " + this.getPersistentClass().getName() + " where roleId = ?",roleId);
			if(list != null && list.size() >= 1){
				return list.get(0).getModuleSum().split(",");
			}
		}
		return null;
		
	}

	@SuppressWarnings("unchecked")
	public String getOneRoleModuleId(Integer roleId) {
		List<RoleModule> list = this.getHibernateTemplate().find("from " + this.getPersistentClass().getName() + " where roleId = ?",roleId);
		if(list != null && list.size() >= 1){
			return list.get(0).getModuleSum();
		}else {
			return null;
		}
	}
	public String[] getRoleModuleIdCount(List<Role> roles) {
		if(roles.size()>0) {
			int size = roles.size();
			for(int i=0;i<roles.size();i++) {
				 if(getOneRoleModuleId(roles.get(i).getRoleId()) == null ) {
					 size--;
				 }
			}
			if(size>0) {
				StringBuffer sb = new StringBuffer(); 
				String[] roleModuleSum = new String[size];
				for(int i=0;i<roleModuleSum.length;i++) {
					 sb.append(getOneRoleModuleId(roles.get(i).getRoleId())+",");
				}
				String[] roleModule = sb.toString().split(",");
				if(roleModule != null && roleModule.length>0) {
					List<String> list = new LinkedList<String>();
			        for(int i = 0; i < roleModule.length; i++) {
			            if(!list.contains(roleModule[i])) {
			                list.add(roleModule[i]);
			            }
			        }
				    return (String[])list.toArray(new String[list.size()]);
				}
			}
		}
		return null;
	}
	
	public IModuleDao getModuleDao() {
		return moduleDao;
	}
	@Resource
	public void setModuleDao(IModuleDao moduleDao) {
		this.moduleDao = moduleDao;
	}
	public IRoleDao getRoleDao() {
		return roleDao;
	}
	@Resource
	public void setRoleDao(IRoleDao roleDao) {
		this.roleDao = roleDao;
	}

}
