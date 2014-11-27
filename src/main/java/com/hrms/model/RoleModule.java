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
 * RoleModule entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "role_module", catalog = "hrms")
public class RoleModule implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 7387242626184637313L;
	private Integer roleModuleId;
	private Role role;
	private String moduleSum;

	// Constructors

	/** default constructor */
	public RoleModule() {
	}

	/** full constructor */
	public RoleModule(Role role, String moduleSum) {
		this.role = role;
		this.moduleSum = moduleSum;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "roleModuleId", unique = true, nullable = false)
	public Integer getRoleModuleId() {
		return this.roleModuleId;
	}

	public void setRoleModuleId(Integer roleModuleId) {
		this.roleModuleId = roleModuleId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "roleId", nullable = false)
	public Role getRole() {
		return this.role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	@Column(name = "moduleSum", nullable = false, length = 250)
	public String getModuleSum() {
		return this.moduleSum;
	}

	public void setModuleSum(String moduleSum) {
		this.moduleSum = moduleSum;
	}

}