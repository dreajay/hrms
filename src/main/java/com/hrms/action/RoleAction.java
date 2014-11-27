package com.hrms.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.hrms.model.Role;
import com.hrms.service.IRoleService;
import com.hrms.util.Page;

@Component("roleAction")
@Scope("prototype")
public class RoleAction extends BaseAction {

	private static final long serialVersionUID = -6942833794154515348L;
	private Role role;
	private Integer roleId;
	private List<Role> roles;
	private IRoleService roleService;
	private Page page;
	private int currentPage=1;
	
	public String role_list() throws Exception {
		int totalSzie = roleService.getSize();
		this.page = new Page(currentPage, totalSzie);
		this.roles = roleService.getListByPage(currentPage, page.getPageSize());
		return "success";
	}
	public String role_add() throws Exception {
		String addAction = getRequest().getParameter("addAction");
		if (addAction==null && addAction != "2") {
			return "add";
		}
		roles = roleService.findByHql("from Role r where roleName='" + role.getRoleName() + "'");
		if (roles.size()>0) {
			addActionError("该角色已存在");
			return "error";
		}
		roleService.saveOrUpdate(role);
		String adds = getRequest().getParameter("add");
		if(adds!=null && adds.equals("2")) {
			addActionMessage("添加成功");
			return "role_adds";
		}
		return "success";
	}
	public String role_update() throws Exception {
		String update = getRequest().getParameter("update");
		if(update!= null && update.equals("update") && roleId != null) {
			if (!getRequest().getParameter("oldRole").equals(role.getRoleName())) {
				roles = roleService.findByHql("from Role r where roleName='" + role.getRoleName() + "'");
				if (roles.size()>0) {
					addActionError("该角色已存在");
					return "error";
				}
			}
			role.setRoleId(roleId);
			roleService.update(role);
			return "success";
		}else {
			role = roleService.findById(roleId);
			return "role_update";
		}
	}
	public String role_delete() throws Exception {
		roleService.deleteById(roleId);
		return "success";
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
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
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
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
