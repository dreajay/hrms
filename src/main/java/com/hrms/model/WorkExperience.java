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
 * WorkExperience entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "work_experience", catalog = "hrms")
public class WorkExperience implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = -7357125532584530599L;
	private Integer workExperienceId;
	private Employee employee;
	private Date accessionDate;
	private Date dimissionDate;
	private String company;
	private String post;
	private String workDescription;

	// Constructors

	/** default constructor */
	public WorkExperience() {
	}

	/** full constructor */
	public WorkExperience(Employee employee, Date accessionDate,
			Date dimissionDate, String company, String post,
			String workDescription) {
		this.employee = employee;
		this.accessionDate = accessionDate;
		this.dimissionDate = dimissionDate;
		this.company = company;
		this.post = post;
		this.workDescription = workDescription;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "workExperienceId", unique = true, nullable = false)
	public Integer getWorkExperienceId() {
		return this.workExperienceId;
	}

	public void setWorkExperienceId(Integer workExperienceId) {
		this.workExperienceId = workExperienceId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "empId")
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "accessionDate", length = 10)
	public Date getAccessionDate() {
		return this.accessionDate;
	}

	public void setAccessionDate(Date accessionDate) {
		this.accessionDate = accessionDate;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "dimissionDate", length = 10)
	public Date getDimissionDate() {
		return this.dimissionDate;
	}

	public void setDimissionDate(Date dimissionDate) {
		this.dimissionDate = dimissionDate;
	}

	@Column(name = "company", length = 45)
	public String getCompany() {
		return this.company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	@Column(name = "post", length = 45)
	public String getPost() {
		return this.post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	@Column(name = "workDescription", length = 65535)
	public String getWorkDescription() {
		return this.workDescription;
	}

	public void setWorkDescription(String workDescription) {
		this.workDescription = workDescription;
	}

}