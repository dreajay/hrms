package com.hrms.model;

import java.io.Serializable;
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

@Entity
@Table(name = "leave", catalog = "hrms")
public class Leave implements Serializable {
	private static final long serialVersionUID = -1986030054865137730L;
	private Integer leaveId;
	private String applyPerson;
	private String applyDept;
	private Date applyDate;
	private String applyReason;
	private LeaveType leaveType;
	private Date startTime;
	private Date endTime;
	private String leaveTime;
	private Date approveDate;
	private String approver;
	private String approveResult;
	private String approveOption;
	private String state;

	public Leave() {
	}

	@Id
	@GeneratedValue
	@Column(name = "leaveId", unique = true, nullable = false)
	public Integer getLeaveId() {
		return leaveId;
	}

	public void setLeaveId(Integer leaveId) {
		this.leaveId = leaveId;
	}

	@Column(name = "applyPerson", nullable = false, length = 10)
	public String getApplyPerson() {
		return applyPerson;
	}

	public void setApplyPerson(String applyPerson) {
		this.applyPerson = applyPerson;
	}

	@Column(name = "applyDept", nullable = false, length = 10)
	public String getApplyDept() {
		return applyDept;
	}

	public void setApplyDept(String applyDept) {
		this.applyDept = applyDept;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "applyDate", nullable = false, length = 10)
	public Date getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(Date applyDate) {
		this.applyDate = applyDate;
	}

	@Column(name = "applyReason", nullable = true, length = 250)
	public String getApplyReason() {
		return applyReason;
	}

	public void setApplyReason(String applyReason) {
		this.applyReason = applyReason;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="leaveTypeId" )
	public LeaveType getLeaveType() {
		return leaveType;
	}

	public void setLeaveType(LeaveType leaveType) {
		this.leaveType = leaveType;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "startTime", nullable = false, length = 20)
	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "endTime", nullable = false, length = 20)
	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Column(name = "leaveTime", nullable = true, length = 20)
	public String getLeaveTime() {
		return leaveTime;
	}

	public void setLeaveTime(String leaveTime) {
		this.leaveTime = leaveTime;
	}


	@Temporal(TemporalType.DATE)
	@Column(name = "approveDate", nullable = true, length = 10)
	public Date getApproveDate() {
		return approveDate;
	}

	public void setApproveDate(Date approveDate) {
		this.approveDate = approveDate;
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

	@Column(name = "approveOption", nullable = true, length = 250)
	public String getApproveOption() {
		return approveOption;
	}

	public void setApproveOption(String approveOption) {
		this.approveOption = approveOption;
	}
	
	@Column(name = "state", nullable = true, length = 10)
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}
