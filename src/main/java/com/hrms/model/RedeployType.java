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
 * EmployeeState entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "redeploy_type", catalog = "hrms")
public class RedeployType implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = -7370539908501532259L;
	private Integer redeployTypeId;
	private String redeployType;
	private String remark;
	private Set<EmployeeRedeploy> employeeRedeploys = new HashSet<EmployeeRedeploy>(0);
	// Constructors

	

	

	/** default constructor */
	public RedeployType() {
	}

	/** full constructor */
	public RedeployType(String redeployType, String remark) {
		this.redeployType = redeployType;
		this.remark = remark;
	}
	
	@Id
	@GeneratedValue
	@Column(name = "redeployTypeId", unique = true, nullable = false)
	public Integer getRedeployTypeId() {
		return redeployTypeId;
	}

	public void setRedeployTypeId(Integer redeployTypeId) {
		this.redeployTypeId = redeployTypeId;
	}

	@Column(name = "redeployType", length = 50 )
	public String getRedeployType() {
		return redeployType;
	}

	public void setRedeployType(String redeployType) {
		this.redeployType = redeployType;
	}
	
	@Column(name = "remark", length = 65535)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "redeployType")
	public Set<EmployeeRedeploy> getEmployeeRedeploys() {
		return employeeRedeploys;
	}

	public void setEmployeeRedeploys(Set<EmployeeRedeploy> employeeRedeploys) {
		this.employeeRedeploys = employeeRedeploys;
	}

}