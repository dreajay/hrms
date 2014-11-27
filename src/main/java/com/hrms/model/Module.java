package com.hrms.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Module entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "module", catalog = "hrms")
public class Module implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = -3214853971328423267L;
	private Integer moduleId;
	private String moduleName;
	private String moduleOrderNum;
	private String linkUrl;
	private Integer parentModuleId;
	private String moduleDescription;
	private Set<RolePermission> rolePermissions = new HashSet<RolePermission>(0);
	private Set<UserPermission> userPermissions = new HashSet<UserPermission>(0);
	private Set<Syslog> syslogs = new HashSet<Syslog>(0);

	// Constructors

	/** default constructor */
	public Module() {
	}

	/** minimal constructor */
	public Module(String moduleName, String moduleOrderNum,
			Integer parentModuleId) {
		this.moduleName = moduleName;
		this.moduleOrderNum = moduleOrderNum;
		this.parentModuleId = parentModuleId;
	}

	/** full constructor */
	public Module(String moduleName, String moduleOrderNum, String linkUrl,
			Integer parentModuleId, String moduleDescription,
			Set<RolePermission> rolePermissions,
			Set<UserPermission> userPermissions, Set<Syslog> syslogs) {
		this.moduleName = moduleName;
		this.moduleOrderNum = moduleOrderNum;
		this.linkUrl = linkUrl;
		this.parentModuleId = parentModuleId;
		this.moduleDescription = moduleDescription;
		this.rolePermissions = rolePermissions;
		this.userPermissions = userPermissions;
		this.syslogs = syslogs;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "moduleId", unique = true, nullable = false)
	public Integer getModuleId() {
		return this.moduleId;
	}

	public void setModuleId(Integer moduleId) {
		this.moduleId = moduleId;
	}

	@Column(name = "moduleName", nullable = false, length = 45)
	public String getModuleName() {
		return this.moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	@Column(name = "moduleOrderNum", nullable = false, length = 45)
	public String getModuleOrderNum() {
		return this.moduleOrderNum;
	}

	public void setModuleOrderNum(String moduleOrderNum) {
		this.moduleOrderNum = moduleOrderNum;
	}

	@Column(name = "linkUrl", length = 250)
	public String getLinkUrl() {
		return this.linkUrl;
	}

	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}

	@Column(name = "parentModuleId", nullable = false)
	public Integer getParentModuleId() {
		return this.parentModuleId;
	}

	public void setParentModuleId(Integer parentModuleId) {
		this.parentModuleId = parentModuleId;
	}

	@Column(name = "moduleDescription", length = 250)
	public String getModuleDescription() {
		return this.moduleDescription;
	}

	public void setModuleDescription(String moduleDescription) {
		this.moduleDescription = moduleDescription;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "module")
	public Set<RolePermission> getRolePermissions() {
		return this.rolePermissions;
	}

	public void setRolePermissions(Set<RolePermission> rolePermissions) {
		this.rolePermissions = rolePermissions;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "module")
	public Set<UserPermission> getUserPermissions() {
		return this.userPermissions;
	}

	public void setUserPermissions(Set<UserPermission> userPermissions) {
		this.userPermissions = userPermissions;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "module")
	public Set<Syslog> getSyslogs() {
		return this.syslogs;
	}

	public void setSyslogs(Set<Syslog> syslogs) {
		this.syslogs = syslogs;
	}

}