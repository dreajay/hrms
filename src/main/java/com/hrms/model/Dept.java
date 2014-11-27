package com.hrms.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Dept entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "dept", catalog = "hrms")
public class Dept implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 7406825106528761506L;
	private Integer deptId;
	private Dept parentDept;
	private String deptName;
	private String deptResponsibility;
	private String deptMan;
	private String deptTel;
	private String remark;
	private Set<Dept> depts = new HashSet<Dept>(0);
	private Set<Employee> employees = new HashSet<Employee>(0);
	private Set<EmployeeRedeploy> employeeRedeploys = new HashSet<EmployeeRedeploy>(0);
	// Constructors

	/** default constructor */
	public Dept() {
	}

	/** minimal constructor */
	public Dept(String deptName) {
		this.deptName = deptName;
	}

	/** full constructor */
	public Dept(Dept parentDept, String deptName, String deptResponsibility,
			String deptMan, String deptTel, String remark, Set<Dept> depts,
			Set<Employee> employees, Set<EmployeeRedeploy> employeeRedeploys) {
		this.parentDept = parentDept;
		this.deptName = deptName;
		this.deptResponsibility = deptResponsibility;
		this.deptMan = deptMan;
		this.deptTel = deptTel;
		this.remark = remark;
		this.depts = depts;
		this.employees = employees;
		this.employeeRedeploys = employeeRedeploys;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "deptId", unique = true, nullable = false)
	public Integer getDeptId() {
		return this.deptId;
	}

	public void setDeptId(Integer deptId) {
		this.deptId = deptId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "parentDeptId")
	public Dept getParentDept() {
		return this.parentDept;
	}

	public void setParentDept(Dept parentDept) {
		this.parentDept = parentDept;
	}

	@Column(name = "deptName", nullable = false, length = 50)
	public String getDeptName() {
		return this.deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	@Column(name = "deptResponsibility", length = 250)
	public String getDeptResponsibility() {
		return this.deptResponsibility;
	}

	public void setDeptResponsibility(String deptResponsibility) {
		this.deptResponsibility = deptResponsibility;
	}

	@Column(name = "deptMan", length = 45)
	public String getDeptMan() {
		return this.deptMan;
	}

	public void setDeptMan(String deptMan) {
		this.deptMan = deptMan;
	}

	@Column(name = "deptTel", length = 45)
	public String getDeptTel() {
		return this.deptTel;
	}

	public void setDeptTel(String deptTel) {
		this.deptTel = deptTel;
	}

	@Column(name = "remark", length = 250)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "parentDept")
	public Set<Dept> getDepts() {
		return this.depts;
	}

	public void setDepts(Set<Dept> depts) {
		this.depts = depts;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "dept")
	public Set<Employee> getEmployees() {
		return this.employees;
	}

	public void setEmployees(Set<Employee> employees) {
		this.employees = employees;
	}
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "dept")
	public Set<EmployeeRedeploy> getEmployeeRedeploys() {
		return this.employeeRedeploys;
	}

	public void setEmployeeRedeploys(Set<EmployeeRedeploy> employeeRedeploys) {
		this.employeeRedeploys = employeeRedeploys;
	}

}