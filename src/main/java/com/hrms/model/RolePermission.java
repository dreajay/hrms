package com.hrms.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * RolePermission entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "role_permission", catalog = "hrms")
public class RolePermission implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 3034178844757767057L;
	private Integer rolePermissionId;
	private Module module;
	private Role role;
	private String actionIds;
	private String permission;

	// Constructors

	/** default constructor */
	public RolePermission() {
	}

	/** minimal constructor */
	public RolePermission(Module module, Role role) {
		this.module = module;
		this.role = role;
	}

	/** full constructor */
	public RolePermission(Module module, Role role, String actionIds,
			String permission) {
		this.module = module;
		this.role = role;
		this.actionIds = actionIds;
		this.permission = permission;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "rolePermissionId", unique = true, nullable = false)
	public Integer getRolePermissionId() {
		return this.rolePermissionId;
	}

	public void setRolePermissionId(Integer rolePermissionId) {
		this.rolePermissionId = rolePermissionId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "moduleId", nullable = false)
	public Module getModule() {
		return this.module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "roleId", nullable = false)
	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Column(name = "actionIds", length = 45)
	public String getActionIds() {
		return this.actionIds;
	}

	public void setActionIds(String actionIds) {
		this.actionIds = actionIds;
	}

	@Column(name = "permission", length = 45)
	public String getPermission() {
		return this.permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

}