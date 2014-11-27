package com.hrms.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Role entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "role", catalog = "hrms")
public class Role implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = -527129095801184271L;
	private Integer roleId;
	private String roleName;
	private String roleDescription;
	private Set<RolePermission> rolePermissions = new HashSet<RolePermission>(0);
	private Set<User> users = new HashSet<User>(0);
	private Set<RoleModule> roleModules = new HashSet<RoleModule>(0);

	// Constructors

	/** default constructor */
	public Role() {
	}

	/** minimal constructor */
	public Role(String roleName) {
		this.roleName = roleName;
	}

	/** full constructor */
	public Role(String roleName, String roleDescription,
			Set<RolePermission> rolePermissions, Set<User> users,
			Set<RoleModule> roleModules) {
		this.roleName = roleName;
		this.roleDescription = roleDescription;
		this.rolePermissions = rolePermissions;
		this.users = users;
		this.roleModules = roleModules;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "roleId", unique = true, nullable = false)
	public Integer getRoleId() {
		return this.roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	@Column(name = "roleName", nullable = false, length = 50)
	public String getRoleName() {
		return this.roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	@Column(name = "roleDescription", length = 250)
	public String getRoleDescription() {
		return this.roleDescription;
	}

	public void setRoleDescription(String roleDescription) {
		this.roleDescription = roleDescription;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "role")
	public Set<RolePermission> getRolePermissions() {
		return this.rolePermissions;
	}

	public void setRolePermissions(Set<RolePermission> rolePermissions) {
		this.rolePermissions = rolePermissions;
	}

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "roles")
	public Set<User> getUsers() {
		return this.users;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "role")
	public Set<RoleModule> getRoleModules() {
		return this.roleModules;
	}

	public void setRoleModules(Set<RoleModule> roleModules) {
		this.roleModules = roleModules;
	}

}