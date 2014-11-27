package com.hrms.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * User entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user", catalog = "hrms", uniqueConstraints = @UniqueConstraint(columnNames = "userName"))
public class User implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 1552159855113956121L;
	private Integer userId;
	private String userName;
	private String userTrueName;
	private String userPassword;
	private Date createDate;
	private Set<UserModule> userModules = new HashSet<UserModule>(0);
	private Set<UserPermission> userPermissions = new HashSet<UserPermission>(0);
	private Set<Syslog> syslogs = new HashSet<Syslog>(0);
	private Set<Role> roles = new HashSet<Role>(0);
	private Integer empId;

	// Constructors

	

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String userName, String userTrueName, String userPassword) {
		this.userName = userName;
		this.userTrueName = userTrueName;
		this.userPassword = userPassword;
	}

	/** full constructor */
	public User(String userName, String userTrueName, String userPassword,
			Date createDate, Set<UserModule> userModules,
			Set<UserPermission> userPermissions, Set<Syslog> syslogs,
			Set<Role> roles) {
		this.userName = userName;
		this.userTrueName = userTrueName;
		this.userPassword = userPassword;
		this.createDate = createDate;
		this.userModules = userModules;
		this.userPermissions = userPermissions;
		this.syslogs = syslogs;
		this.roles = roles;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "userId", unique = true, nullable = false)
	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	@Column(name = "userName", unique = true, nullable = false)
	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	@Column(name = "userTrueName", nullable = false, length = 45)
	public String getUserTrueName() {
		return this.userTrueName;
	}

	public void setUserTrueName(String userTrueName) {
		this.userTrueName = userTrueName;
	}

	@Column(name = "userPassword", nullable = false, length = 100)
	public String getUserPassword() {
		return this.userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	@Column(name = "createDate", length = 19)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<UserModule> getUserModules() {
		return this.userModules;
	}

	public void setUserModules(Set<UserModule> userModules) {
		this.userModules = userModules;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "user")
	public Set<UserPermission> getUserPermissions() {
		return this.userPermissions;
	}

	public void setUserPermissions(Set<UserPermission> userPermissions) {
		this.userPermissions = userPermissions;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "user")
	public Set<Syslog> getSyslogs() {
		return this.syslogs;
	}

	public void setSyslogs(Set<Syslog> syslogs) {
		this.syslogs = syslogs;
	}

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "user_role", catalog = "hrms", joinColumns = { @JoinColumn(name = "userId", nullable = false, updatable = false) }, inverseJoinColumns = { @JoinColumn(name = "roleId", nullable = false, updatable = false) })
	public Set<Role> getRoles() {
		return this.roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	
	@Column(name="empId", unique = true, nullable = false)
	public Integer getEmpId() {
		return empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}
}