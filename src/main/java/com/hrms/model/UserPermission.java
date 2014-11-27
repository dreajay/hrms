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
 * UserPermission entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user_permission", catalog = "hrms")
public class UserPermission implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 5694497869471725513L;
	private Integer userPermissionId;
	private Module module;
	private User user;
	private String actionIds;
	private String permission;

	// Constructors

	/** default constructor */
	public UserPermission() {
	}

	/** minimal constructor */
	public UserPermission(Module module, User user) {
		this.module = module;
		this.user = user;
	}

	/** full constructor */
	public UserPermission(Module module, User user, String actionIds,
			String permission) {
		this.module = module;
		this.user = user;
		this.actionIds = actionIds;
		this.permission = permission;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "userPermissionId", unique = true, nullable = false)
	public Integer getUserPermissionId() {
		return this.userPermissionId;
	}

	public void setUserPermissionId(Integer userPermissionId) {
		this.userPermissionId = userPermissionId;
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
	@JoinColumn(name = "userId", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
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