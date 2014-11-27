package com.hrms.model;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name = "recruit", catalog = "hrms")
public class Recruit implements Serializable {

	private static final long serialVersionUID = -1233915664417592346L;
	
	private Integer recruitId;
	private String recruitTitle;
	private String applyDept;
	private String applyPerson;
	private String applyPersonEmail;
	private Date applyDate;
	private String applyReason;
	private String recruitPost;
	private String postRequire;
	private Integer recruitCount;
	private String personRequire;
	private String workingAge;
	private String wage;
	private String recruitType;
	private String recruitWay;
	private Date approveDate;
	private String state;
	private String approver;
	private String approveResult;
	private String approverOption;
	private Date publishDate;
	private Date deadline;
	private Set<JobSeeker> jobSeekers = new HashSet<JobSeeker>();
	
	

	public Recruit() {
	}
	
	@Id
	@GeneratedValue
	@Column(name = "recruitId", unique = true, nullable = false)
	public Integer getRecruitId() {
		return recruitId;
	}
	public void setRecruitId(Integer recruitId) {
		this.recruitId = recruitId;
	}
	
	@Column(name = "recruitTitle", nullable = false, length = 50)
	public String getRecruitTitle() {
		return recruitTitle;
	}
	public void setRecruitTitle(String recruitTitle) {
		this.recruitTitle = recruitTitle;
	}
	
	@Column(name = "applyDept", nullable = false, length = 10)
	public String getApplyDept() {
		return applyDept;
	}
	public void setApplyDept(String applyDept) {
		this.applyDept = applyDept;
	}
	
	@Column(name = "applyPerson", nullable = false, length = 10)
	public String getApplyPerson() {
		return applyPerson;
	}
	public void setApplyPerson(String applyPerson) {
		this.applyPerson = applyPerson;
	}
	@Column(name = "applyPersonEmail", nullable = true, length = 50)
	public String getApplyPersonEmail() {
		return applyPersonEmail;
	}

	public void setApplyPersonEmail(String applyPersonEmail) {
		this.applyPersonEmail = applyPersonEmail;
	}
	
	@Temporal(TemporalType.DATE)
	@Column(name = "applyDate", nullable = false, length = 10)
	public Date getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}
	
	@Column(name = "applyReason", nullable = false, length = 250)
	public String getApplyReason() {
		return applyReason;
	}
	public void setApplyReason(String applyReason) {
		this.applyReason = applyReason;
	}
	
	@Column(name = "recruitPost", nullable = true, length = 20)
	public String getRecruitPost() {
		return recruitPost;
	}
	public void setRecruitPost(String recruitPost) {
		this.recruitPost = recruitPost;
	}
	
	@Column(name = "postRequire", nullable = true, length = 250)
	public String getPostRequire() {
		return postRequire;
	}
	public void setPostRequire(String postRequire) {
		this.postRequire = postRequire;
	}
	
	@Column(name = "recruitCount", nullable = true, length = 5)
	public Integer getRecruitCount() {
		return recruitCount;
	}
	public void setRecruitCount(Integer recruitCount) {
		this.recruitCount = recruitCount;
	}
	
	@Column(name = "personRequire", nullable = true, length = 250)
	public String getPersonRequire() {
		return personRequire;
	}
	public void setPersonRequire(String personRequire) {
		this.personRequire = personRequire;
	}
	
	@Column(name = "workingAge", nullable = true, length = 20)
	public String getWorkingAge() {
		return workingAge;
	}
	public void setWorkingAge(String workingAge) {
		this.workingAge = workingAge;
	}
	
	@Column(name = "wage", nullable = true, length = 20)
	public String getWage() {
		return wage;
	}
	public void setWage(String wage) {
		this.wage = wage;
	}
	
	@Column(name = "recruitType", nullable = true, length = 20)
	public String getRecruitType() {
		return recruitType;
	}
	public void setRecruitType(String recruitType) {
		this.recruitType = recruitType;
	}
	
	@Column(name = "recruitWay", nullable = true, length = 20)
	public String getRecruitWay() {
		return recruitWay;
	}
	public void setRecruitWay(String recruitWay) {
		this.recruitWay = recruitWay;
	}
	
	@Temporal(TemporalType.DATE)
	@Column(name = "approveDate", nullable = true, length = 10)
	public Date getApproveDate() {
		return approveDate;
	}
	public void setApproveDate(Date approveDate) {
		this.approveDate = approveDate;
	}
	
	@Column(name = "state", nullable = true, length = 10)
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	@Column(name = "approver", nullable = true, length = 10)
	public String getApprover() {
		return approver;
	}
	public void setApprover(String approver) {
		this.approver = approver;
	}
	
	@Column(name = "approveResult", nullable = true, length = 10)
	public String getApproveResult() {
		return approveResult;
	}

	public void setApproveResult(String approveResult) {
		this.approveResult = approveResult;
	}
	
	@Column(name = "approverOption", nullable = true, length = 250)
	public String getApproverOption() {
		return approverOption;
	}
	public void setApproverOption(String approverOption) {
		this.approverOption = approverOption;
	}
	
	@Temporal(TemporalType.DATE)
	@Column(name = "publishDate", nullable = true, length = 10)
	public Date getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}
	
	@Temporal(TemporalType.DATE)
	@Column(name = "deadline", nullable = true, length = 10)
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "recruit")
	public Set<JobSeeker> getJobSeekers() {
		return jobSeekers;
	}

	public void setJobSeekers(Set<JobSeeker> jobSeekers) {
		this.jobSeekers = jobSeekers;
	}
	
	
}
