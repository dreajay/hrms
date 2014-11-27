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
@Table(name = "employee_state", catalog = "hrms")
public class EmployeeState implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = -7399135223666476654L;
	private Integer employeeStateId;
	private String employeeState;
	private String remark;
	private Set<Employee> employees = new HashSet<Employee>(0);

	// Constructors

	/** default constructor */
	public EmployeeState() {
	}

	/** full constructor */
	public EmployeeState(String employeeState, String remark,
			Set<Employee> employees) {
		this.employeeState = employeeState;
		this.remark = remark;
		this.employees = employees;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "employeeStateId", unique = true, nullable = false)
	public Integer getEmployeeStateId() {
		return this.employeeStateId;
	}

	public void setEmployeeStateId(Integer employeeStateId) {
		this.employeeStateId = employeeStateId;
	}

	@Column(name = "employeeState", length = 45)
	public String getEmployeeState() {
		return this.employeeState;
	}

	public void setEmployeeState(String employeeState) {
		this.employeeState = employeeState;
	}

	@Column(name = "remark", length = 65535)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "employeeState")
	public Set<Employee> getEmployees() {
		return this.employees;
	}

	public void setEmployees(Set<Employee> employees) {
		this.employees = employees;
	}

}