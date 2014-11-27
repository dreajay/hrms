package com.hrms.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Action entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "action", catalog = "hrms")
public class Action implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 9019550382863781189L;
	private Integer actionId;
	private String action;

	// Constructors

	/** default constructor */
	public Action() {
	}

	/** full constructor */
	public Action(String action) {
		this.action = action;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "actionId", unique = true, nullable = false)
	public Integer getActionId() {
		return this.actionId;
	}

	public void setActionId(Integer actionId) {
		this.actionId = actionId;
	}

	@Column(name = "action", nullable = false, length = 45)
	public String getAction() {
		return this.action;
	}

	public void setAction(String action) {
		this.action = action;
	}

}