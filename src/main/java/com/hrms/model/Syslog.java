package com.hrms.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Syslog entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "syslog", catalog = "hrms")
public class Syslog implements java.io.Serializable {
	private static final long serialVersionUID = 5610386748757800330L;
	// Fields
	private Integer logId;
	private Module module;
	private User user;
	private String type;
	private Date date;
	private String action;
	private String accessIp;

	// Constructors

	/** default constructor */
	public Syslog() {
	}

	/** minimal constructor */
	public Syslog(User user, Date date, String action, String accessIp) {
		this.user = user;
		this.date = date;
		this.action = action;
		this.accessIp = accessIp;
	}

	/** full constructor */
	public Syslog(Module module, User user, String type, Date date,
			String action, String accessIp) {
		this.module = module;
		this.user = user;
		this.type = type;
		this.date = date;
		this.action = action;
		this.accessIp = accessIp;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "logId", unique = true, nullable = false)
	public Integer getLogId() {
		return this.logId;
	}

	public void setLogId(Integer logId) {
		this.logId = logId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "moduleId")
	public Module getModule() {
		return this.module;
	}

	public void setModule(Module module) {
		this.module = module;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userId", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "type", length = 45)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "date", nullable = false, length = 19)
	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	@Column(name = "action", nullable = false, length = 45)
	public String getAction() {
		return this.action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	@Column(name = "accessIp", nullable = false, length = 45)
	public String getAccessIp() {
		return this.accessIp;
	}

	public void setAccessIp(String accessIp) {
		this.accessIp = accessIp;
	}

}