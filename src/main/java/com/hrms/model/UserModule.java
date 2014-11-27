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
 * UserModule entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "user_module", catalog = "hrms")
public class UserModule implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = -1300221107986814307L;
	private Integer userModuleId;
	private User user;
	private String moduleSum;

	// Constructors

	/** default constructor */
	public UserModule() {
	}

	/** full constructor */
	public UserModule(User user, String moduleSum) {
		this.user = user;
		this.moduleSum = moduleSum;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "userModuleId", unique = true, nullable = false)
	public Integer getUserModuleId() {
		return this.userModuleId;
	}

	public void setUserModuleId(Integer userModuleId) {
		this.userModuleId = userModuleId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "userId", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "moduleSum", nullable = false, length = 250)
	public String getModuleSum() {
		return this.moduleSum;
	}

	public void setModuleSum(String moduleSum) {
		this.moduleSum = moduleSum;
	}

}