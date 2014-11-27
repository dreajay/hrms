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
 * Action entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "leaveType", catalog = "hrms")
public class LeaveType implements java.io.Serializable {
	
	private static final long serialVersionUID = -1539459234986427159L;
	private Integer leaveTypeId;
	private String leaveType;
	private Set<Leave> leaves = new HashSet<Leave>();
	
	public LeaveType(){
		
	}
	
	@Id
	@GeneratedValue
	@Column(name = "leaveTypeId", unique = true, nullable = false)
	public Integer getLeaveTypeId() {
		return leaveTypeId;
	}
	public void setLeaveTypeId(Integer leaveTypeId) {
		this.leaveTypeId = leaveTypeId;
	}
	
	@Column(name = "leaveType", unique = true, nullable = false)
	public String getLeaveType() {
		return leaveType;
	}
	public void setLeaveType(String leaveType) {
		this.leaveType = leaveType;
	}
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "leaveType")
	public Set<Leave> getLeaves() {
		return leaves;
	}
	public void setLeaves(Set<Leave> leaves) {
		this.leaves = leaves;
	}

}