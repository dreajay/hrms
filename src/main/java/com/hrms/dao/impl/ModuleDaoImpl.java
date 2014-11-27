package com.hrms.dao.impl;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.hrms.dao.IModuleDao;
import com.hrms.model.Module;

@Repository("moduleDao")
public class ModuleDaoImpl extends GenericDaoImpl<Module, Integer> implements
		IModuleDao {
	
	@SuppressWarnings("unchecked")
	public Module getModuleByLinkUrl(String linkUrl) {
		List<Module> modules = getHibernateTemplate().find("from Module where linkUrl=?",linkUrl);
		if (modules!=null && modules.size() > 0) {
			return modules.get(0);
		}
		return null;
	}
	@SuppressWarnings("unchecked")
	public boolean allModuleTreeInXml(String fileName) {
		List<Module> moduleList = getHibernateTemplate().find("from Module");
        File file = new File(fileName);   
        try {   
            PrintWriter out = new PrintWriter(file,"UTF-8");
            out.println("<?xml version='1.0' encoding='UTF-8'?>");
            out.println("<tree id=\"0\">");
            out.println("<item text=\""+getRootModule().getModuleName()+"\" id=\""+getRootModule().getModuleId()+"\" open=\"1\" im0=\"tombs.gif\" im1=\"tombs.gif\" im2=\"iconSafe.gif\" call=\"1\" select=\"1\">");
            for (int i = 0; i < moduleList.size(); i++) {
            	moduleTreeInXml(moduleList.get(i).getModuleId(),moduleList, out);
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
	public void moduleTreeInXml(Integer moduleId,List<Module> roleModuleList,PrintWriter out) {
		Module module = findById(moduleId);
		if (!moduleId.equals(getRootModule().getModuleId())) {
			if (isLeaf(moduleId)) {
				out.println("<item text=\""+module.getModuleName()+"\" id=\""+moduleId+"\" im0=\"book_titel.gif\" im1=\"book.gif\" im2=\"book_titel.gif\"></item>");
			}else {
				out.println("<item text=\""+module.getModuleName()+"\" id=\""+moduleId+"\" im0=\"book_titel.gif\" im1=\"book.gif\" im2=\"book_titel.gif\">");
				List<Module> childrenList = getChildrenModule(moduleId);
				if (childrenList!=null && childrenList.size()>0) {
					for (int i = 0; i < childrenList.size(); i++) {
						for (int j = 0; j < roleModuleList.size(); j++) {
							if (childrenList.get(i).getModuleId().equals(roleModuleList.get(j).getModuleId())) {
								moduleTreeInXml(childrenList.get(i).getModuleId(),roleModuleList, out);
								roleModuleList.remove(j);
							}
						}
					}
					out.println("</item>");
				}
				
			}
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Module> getChildrenModule(Integer moduleId) {
		return getHibernateTemplate().find(
				"from Module where parentModuleId=?", moduleId);
	}

	public Module getParentModule(Integer moduleId) {
		return (Module) getHibernateTemplate().get(getPersistentClass(),
				moduleId);
	}

	@SuppressWarnings("unchecked")
	public boolean isLeaf(Integer moduleId) {
		List<Module> leafList = getHibernateTemplate().find(
				"from Module where parentModuleId=?", moduleId);
		if (leafList == null || leafList.size() == 0) {
			return true;
		} else {
			return false;
		}
	}

	public Module getRootModule() {
		return (Module) getHibernateTemplate().find(
				"from Module where parentModuleId=0").get(0);
	}
	@SuppressWarnings("unchecked")
	public List<Module> getModule(String[] moduleIds) {
		if (moduleIds!=null&&moduleIds.length>0) {
			Module module;
			List<Module> list2= getHibernateTemplate().find("from Module where moduleId=?",1);
			for(int i=0;i<moduleIds.length;i++) {
				List<Module> l = getHibernateTemplate().find("from Module where moduleId=?",Integer.parseInt(moduleIds[i]));
				if (l!=null && l.size()>0) {
					module = l.get(0);
					if(!list2.contains(module) && module != null) {
						list2.add(module);
					}
				}
			}
			return list2;
		}
		return null;
	}
	@SuppressWarnings("unchecked")
	public String getModules(Integer moduleId) {
		StringBuffer leftModule = new StringBuffer();
		if (moduleId.equals(getRootModule().getModuleId())) {
			return leftModule.toString();
		} else {
			Module module = findById(moduleId);
			if (module != null) {
				if (module.getParentModuleId().equals(
						getRootModule().getModuleId())) {
					if (isLeaf(moduleId)) {
						leftModule
								.append(
										"var fun"
												+ module.getModuleId()
												+ "= new TreeNode('"
												+ module.getModuleName()
												+ "', '"
												+ module.getLinkUrl()
												+ "', 'tree_node.gif', null, 'tree_node.gif', null);")
								.append(
										"root.add(fun" + module.getModuleId()
												+ ");");
					} else {
						leftModule.append(
								"var fun" + module.getModuleId()
										+ " = new TreeNode('"
										+ module.getModuleName() + "');")
								.append(
										"root.add(fun" + module.getModuleId()
												+ ");");

						List<Module> modules = getHibernateTemplate().find(
								"from Module where parentModuleId=?", moduleId);
						for (int i = 0; i < modules.size(); i++) {
							getModules(modules.get(i).getModuleId());
						}
					}
				} else {
					if (isLeaf(moduleId)) {
						leftModule
								.append(
										"var fun"
												+ module.getModuleId()
												+ "= new TreeNode('"
												+ module.getModuleName()
												+ "', '"
												+ module.getLinkUrl()
												+ "', 'tree_node.gif', null, 'tree_node.gif', null);")
								.append(
										"fun" + module.getParentModuleId()
												+ ".add(fun"
												+ module.getModuleId() + ");");
					} else {
						leftModule.append(
								"var fun" + module.getModuleId()
										+ " = new TreeNode('"
										+ module.getModuleName() + "');")
								.append(
										"fun" + module.getParentModuleId()
												+ ".add(fun"
												+ module.getModuleId() + ");");

						List<Module> modules = getHibernateTemplate().find(
								"from Module where parentModuleId=?", moduleId);
						for (int i = 0; i < modules.size(); i++) {
							getModules(modules.get(i).getModuleId());
						}
					}
				}

			}

			return leftModule.toString();
		}

	}

	@SuppressWarnings("unchecked")
	public List<Object> getSelectParentModule() {
		List allModule = getHibernateTemplate().find(" select m, n" + " from Module m, Module n " + " where m.parentModuleId=n.moduleId");   
		//List<Module> allModule = getHibernateTemplate().find("select m.moduleId,m.moduleName,m.moduleOrderNum,m.linkUrl,m.parentModuleId,n.moduleName as parentModuleName,m.moduleDescription from Module m,Module n where m.parentModuleId=n.moduleId");
		return allModule;
	}
	@SuppressWarnings("unchecked")
	public String getModOrdNum(Integer parentModuleId) {
		String moduleOrderNum = "";
		String s1="";
		String s2="";
		String s3="";
		Integer int1=0;
		Integer int2=0;
		List<Module> list1 = getHibernateTemplate().find("from Module where parentModuleId=? order by moduleOrderNum desc",
				getRootModule().getModuleId());
		if (parentModuleId.equals(getRootModule().getModuleId())) {
			if (list1 != null && list1.size() > 0) {
				s1= list1.get(0).getModuleOrderNum();
				s2 = s1.substring(1, 3);
				 int1 = Integer.valueOf(s2);
				 int2 = int1 + 1;
				if (int2<10) {
					s3 = 0+String.valueOf(int2);
				}else {
					s3 = String.valueOf(int2);
				}
				moduleOrderNum = s1.substring(0,1) + s3 + s1.substring(3, 7);
			}else {
				 s1 = getRootModule().getModuleOrderNum();
				 s2 = s1.substring(1, 3);
				 int1 = Integer.valueOf(s2);
				 int2 = int1 + 1;
				if (int2<10) {
					s3 = 0+String.valueOf(int2);
				}else {
					s3 = String.valueOf(int2);
				}
				moduleOrderNum = s1.substring(0,1) + s3 + s1.substring(3, 7);
			}
			
		}else {
			for(int i=0;i<list1.size();i++) {
				List<Module> list2 = getHibernateTemplate().find("from Module where parentModuleId=? order by moduleOrderNum desc",list1.get(i).getModuleId());
				if(parentModuleId.equals(list1.get(i).getModuleId())) {
					if(list2!=null&&list2.size()>0) {
						s1= list2.get(0).getModuleOrderNum();
						s2 = s1.substring(3, 5);
						 int1 = Integer.valueOf(s2);
						 int2 = int1 + 1;
						if (int2<10) {
							s3 = 0+String.valueOf(int2);
						}else {
							s3 = String.valueOf(int2);
						}
						moduleOrderNum = s1.substring(0,3) + s3 + s1.substring(5, 7);
						break;
					}else {
						s1= list1.get(i).getModuleOrderNum();
						s2 = s1.substring(3, 5);
						 int1 = Integer.valueOf(s2);
						 int2 = int1 + 1;
						if (int2<10) {
							s3 = 0+String.valueOf(int2);
						}else {
							s3 = String.valueOf(int2);
						}
						moduleOrderNum = s1.substring(0,3) + s3 + s1.substring(5, 7);
						break;
					}
					
				}else {
						for (int j = 0; j < list2.size(); j++) {
							if(parentModuleId.equals(list2.get(j).getModuleId())) {
								List<Module> list3 = getHibernateTemplate().find("from Module where parentModuleId=? order by moduleOrderNum desc",list2.get(j).getModuleId());
								if(list3!=null&list3.size()>0) {
									s1= list3.get(0).getModuleOrderNum();
									s2 = s1.substring(5, 7);
									 int1 = Integer.valueOf(s2);
									 int2 = int1 + 1;
									if (int2<10) {
										s3 = 0+String.valueOf(int2);
									}else {
										s3 = String.valueOf(int2);
									}
									moduleOrderNum = s1.substring(0,5) + s3;
									break;
								}else {
									s1= list2.get(j).getModuleOrderNum();
									s2 = s1.substring(5, 7);
									 int1 = Integer.valueOf(s2);
									 int2 = int1 + 1;
									if (int2<10) {
										s3 = 0+String.valueOf(int2);
									}else {
										s3 = String.valueOf(int2);
									}
									moduleOrderNum = s1.substring(0,5) + s3;
									break;
								}
							}
						}
				}
				
			}
			
			
		}
		this.getHibernateTemplate().getSessionFactory().getCurrentSession().flush();
		return moduleOrderNum;
	}


}
