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
 * EmployeeState entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "employee_redeploy", catalog = "hrms")
public class EmployeeRedeploy implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = -6477542990587491075L;
	private Integer redeployId;
	private Employee employee;
	private Date applyDate;
	private String applyPerson;
	private Date redeployDate;
	private String deployDept;
	private String deployPost;
	private String remark;
	private Dept dept;
	private Post post;
	private RedeployType redeployType;
	private String transactor;
	private String transactorOption;
	private String state;

	// Constructors

	/** default constructor */
	public EmployeeRedeploy() {
	}

	/** full constructor */
	public EmployeeRedeploy(Date applyDate, Date redeployDate,
			String deployDept, String deployPost, String state) {
		this.applyDate = applyDate;
		this.redeployDate = redeployDate;
		this.deployDept = deployDept;
		this.deployPost = deployPost;
		this.state = state;
	}

	// Property accessors
	
	@Id
	@GeneratedValue
	@Column(name = "redeployId", unique = true, nullable = false)
	public Integer getRedeployId() {
		return redeployId;
	}

	public void setRedeployId(Integer redeployId) {
		this.redeployId = redeployId;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "empId")
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	
	@Temporal(TemporalType.DATE)
	@Column(name = "applyDate", length = 10)
	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	@Column(name = "applyPerson", length = 45)
	public String getApplyPerson() {
		return applyPerson;
	}

	public void setApplyPerson(String applyPerson) {
		this.applyPerson = applyPerson;
	}
	
	
	@Temporal(TemporalType.DATE)
	@Column(name = "redeployDate", length = 10)
	public Date getRedeployDate() {
		return redeployDate;
	}

	public void setRedeployDate(Date redeployDate) {
		this.redeployDate = redeployDate;
	}

	@Column(name = "deployDept", length = 50)
	public String getDeployDept() {
		return deployDept;
	}

	public void setDeployDept(String deployDept) {
		this.deployDept = deployDept;
	}

	@Column(name = "deployPost", length = 50)
	public String getDeployPost() {
		return deployPost;
	}

	public void setDeployPost(String deployPost) {
		this.deployPost = deployPost;
	}

	@Column(name = "remark", length = 300)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "redeployDeptId")
	public Dept getDept() {
		return this.dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "redeployPostId")
	public Post getPost() {
		return this.post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "redeployTypeId")
	public RedeployType getRedeployType() {
		return redeployType;
	}

	public void setRedeployType(RedeployType redeployType) {
		this.redeployType = redeployType;
	}

	@Column(name = "transactor", length = 50)
	public String getTransactor() {
		return transactor;
	}

	public void setTransactor(String transactor) {
		this.transactor = transactor;
	}
	
	@Column(name = "transactorOption", length = 200)
	public String getTransactorOption() {
		return transactorOption;
	}

	public void setTransactorOption(String transactorOption) {
		this.transactorOption = transactorOption;
	}
	
	@Column(name = "state", length = 50)
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	

}