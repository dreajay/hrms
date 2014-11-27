package com.hrms.dao.impl;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.hrms.dao.IModuleDao;
import com.hrms.dao.IRoleModuleDao;
import com.hrms.dao.IUserDao;
import com.hrms.dao.IUserModuleDao;
import com.hrms.model.Module;
import com.hrms.model.Role;
import com.hrms.model.User;
import com.hrms.model.UserModule;

@Repository("userModuleDao")
public class UserModuleDaoImpl extends GenericDaoImpl<UserModule, Integer> implements
		IUserModuleDao {
	private IRoleModuleDao roleModuleDao;
	private IModuleDao moduleDao;
	private IUserDao userDao;
	
	
	public boolean addToUser(Integer userId,String moduleIdSum) {
		if (userId!=null && userId>0 && moduleIdSum!=null && !moduleIdSum.equals("")) {
			UserModule userModule = getUserModuleByUserId(userId);
			if (userModule!=null) {
				String[] moduleIdSumArray = moduleIdSum.split(",");
				List<String> list = new LinkedList<String>();
				String[] sIdSum = getUserModuleId(userId);
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
					userModule.setModuleSum(newrIdSum);
					return this.update(userModule);
				}
			}else {
				userModule = new UserModule();
				User user = userDao.findById(userId);
				userModule.setUser(user);
				userModule.setModuleSum(moduleIdSum);
				return this.save(userModule);
			}
			
		}
		return false;
	}
	
	public boolean removeFromUser(Integer userId, String moduleIdSum) {
		if (userId!=null && userId>0 && moduleIdSum!=null && !moduleIdSum.equals("")) {
			UserModule userModule = getUserModuleByUserId(userId);
			if (userModule!=null) {
				List<String> list = new LinkedList<String>();
				String[] userModuleIdSum = getUserModuleId(userId);
				String[] moduleIdSumArray = moduleIdSum.split(",");
				if (userModuleIdSum!=null && userModuleIdSum.length>0) {
					for (int i = 0; i < userModuleIdSum.length; i++) {
			            if(!list.contains(userModuleIdSum[i])) {
			                list.add(userModuleIdSum[i]);
			            }
					}
				}
				for (int j = 0; j < moduleIdSumArray.length; j++) {
					if (list.contains(moduleIdSumArray[j])) {
						list.remove(moduleIdSumArray[j]);
					}
				}
				if (list.size()<userModuleIdSum.length) {
					String[] newrIdSumArray = (String[])list.toArray(new String[list.size()]);
					String newrIdSum="1";
					for (int i = 0; i < newrIdSumArray.length; i++) {
						newrIdSum = newrIdSum + "," +newrIdSumArray[i];
					}
					if (newrIdSum.length()>2) {
						newrIdSum = newrIdSum.substring(2);
					}
					userModule.setModuleSum(newrIdSum);
					return this.update(userModule);
				}
			}
		}
		return false;
	}
	public boolean userModuleTreeInXml(String fileName,Integer userId) {
		
        File file = new File(fileName);   
        try {   
            PrintWriter out = new PrintWriter(file,"UTF-8");
            out.println("<?xml version='1.0' encoding='UTF-8'?>");
            out.println("<tree id=\"0\">");
            out.println("<item text=\""+moduleDao.getRootModule().getModuleName()+"\" id=\""+moduleDao.getRootModule().getModuleId()+"\" open=\"1\" im0=\"tombs.gif\" im1=\"tombs.gif\" im2=\"iconSafe.gif\" call=\"1\" select=\"1\">");
            if (userId!=null && userId>=0) {
            	List<Module> userModuleList = getUserModule(userId);
            	if (userModuleList!=null && userModuleList.size()>0) {
            		for (int i = 0; i < userModuleList.size(); i++) {
                    	moduleDao.moduleTreeInXml(userModuleList.get(i).getModuleId(),userModuleList, out);
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
	
	public List<Module> getUserModule(Integer userId) {
		String[] s = getUserModuleId(userId);
		if (s!=null && s.length>0) {
			return moduleDao.getModule(s);
		}
		return null;
	}
	
	@SuppressWarnings("unchecked")
	public UserModule getUserModuleByUserId(Integer userId) {
		List<UserModule> list = getHibernateTemplate().find("from UserModule where userId=?",userId);
		if (list!=null && list.size()>0) {
			return list.get(0);
		}
		return null;
	}
	
	public String[] getUserModuleIdSum(Integer userId) {
		String[] userModuleCount = getUserModuleCount(userId);
		List<Role> roles = userDao.findRoles(userId);
		String[] roleModuleIdCount = roleModuleDao.getRoleModuleIdCount(roles);
		StringBuffer sb = new StringBuffer();
		if(userModuleCount != null && userModuleCount.length>0) {
			for(int i=0;i<userModuleCount.length;i++) {
				sb.append(userModuleCount[i]+",");
			}
		}
		if(roleModuleIdCount != null && roleModuleIdCount.length>0) {
			for(int i=0;i<roleModuleIdCount.length;i++) {
				sb.append(roleModuleIdCount[i]+",");
			}
		}
		if(sb.length()>0) {
			String[] userModuleIdSum = sb.toString().split(",");
			if(userModuleIdSum != null && userModuleIdSum.length>0) {
				
				List<String> list = new LinkedList<String>();
		        for(int i = 0; i < userModuleIdSum.length; i++) {
		        	if(userModuleIdSum[i] != null) {
		        		if(!list.contains(userModuleIdSum[i])) {
			                list.add(userModuleIdSum[i]);
			            }
					}
		        }
			    return (String[])list.toArray(new String[list.size()]);
			}else {
				return null;
			}
		}else {
			return null;
		}
		
	}
		
	public String getUserModuleTree(String[] userModuleIdSum) {
		if(userModuleIdSum != null && userModuleIdSum.length>0) {
			
			StringBuffer leftModuleTree = new StringBuffer();
			leftModuleTree.append("<script type=text/javascript>")
			.append("var tree = null;")
			.append("var root = new TreeNode('" + moduleDao.getRootModule().getModuleName() + "');");
			for(int i=0;i<userModuleIdSum.length;i++){
				leftModuleTree.append(moduleDao.getModules(Integer.valueOf(userModuleIdSum[i])));
			}
			leftModuleTree.append("tree = new Tree(root);")
			.append("tree.show('menuTree');")
			.append("</script>");
			return leftModuleTree.toString();
		} else {
			return "你尚未分配功能菜单，请与管理员联系！";
		}
	
	}
	@SuppressWarnings("unchecked")
	public String[] getUserModuleCount(Integer userId) {
		List<UserModule> list = this.getHibernateTemplate().find("from " + this.getPersistentClass().getName() + " where userId = ?",userId);
		if(list != null && list.size() >= 1){
			return list.get(0).getModuleSum().split(",");
		} else {
			return null;
		}
	}
	@SuppressWarnings("unchecked")
	public String[] getUserModuleId(Integer userId) {
		if (userId!=null) {
			List<UserModule> list = this.getHibernateTemplate().find("from " + this.getPersistentClass().getName() + " where userId = ?",userId);
			if(list != null && list.size() >= 1){
				return list.get(0).getModuleSum().split(",");
			}
		}
		return null;
		
	}
	public IUserDao getUserDao() {
		return userDao;
	}
	@Resource
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	public IModuleDao getModuleDao() {
		return moduleDao;
	}
	@Resource
	public void setModuleDao(IModuleDao moduleDao) {
		this.moduleDao = moduleDao;
	}
	public IRoleModuleDao getRoleModuleDao() {
		return roleModuleDao;
	}
	@Resource
	public void setRoleModuleDao(IRoleModuleDao roleModuleDao) {
		this.roleModuleDao = roleModuleDao;
	}
}
