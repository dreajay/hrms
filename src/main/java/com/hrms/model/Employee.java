package com.hrms.model;

import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Employee entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "employee", catalog = "hrms")
public class Employee implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 1L;
	private Integer empId;
	private Dept dept;
	private EmployeeState employeeState;
	private Post post;
	private String empName;
	private String empSex;
	private Date empBirthday;
	private String empIdNumber;
	private String empAddress;
	private String empTel;
	private String empEmail;
	private String empQq;
	private String empNational;
	private String empNativePlace;
	private String empMarriage;
	private String empPoliticalVisage;
	private String empPhoto;
	private String empEducation;
	private String empDegree;
	private String empGraduationSchool;
	private Date empGraduationDate;
	private String empSpeciality;
	private String empBankName;
	private String empBankNumber;
	private Date empAccessionDate;
	private Date empDimissionDate;
	private String empTitle;
	private float empWage;
	private String remark;
	private Set<WorkExperience> workExperiences = new HashSet<WorkExperience>(0);
	private Set<EmployeeRedeploy> employeeRedeploys = new HashSet<EmployeeRedeploy>(0);
	// Constructors

	/** default constructor */
	public Employee() {
	}

	/** minimal constructor */
	public Employee(String empName, String empSex, String empIdNumber,
			String empTel, String empEmail) {
		this.empName = empName;
		this.empSex = empSex;
		this.empIdNumber = empIdNumber;
		this.empTel = empTel;
		this.empEmail = empEmail;
	}

	/** full constructor */
	public Employee(Dept dept, EmployeeState employeeState, Post post,
			String empName, String empSex, Date empBirthday,
			String empIdNumber, String empAddress, String empTel,
			String empEmail, String empQq, String empNational,
			String empMarriage, String empPoliticalVisage, String empPhoto,
			String empEducation,String empDegree, String empGraduationSchool,
			Date empGraduationDate, String empSpeciality, String empBankName,
			String empBankNumber, Date empAccessionDate, Date empDimissionDate,
			String empTitle, float empWage, String remark,
			Set<WorkExperience> workExperiences) {
		this.dept = dept;
		this.employeeState = employeeState;
		this.post = post;
		this.empName = empName;
		this.empSex = empSex;
		this.empBirthday = empBirthday;
		this.empIdNumber = empIdNumber;
		this.empAddress = empAddress;
		this.empTel = empTel;
		this.empEmail = empEmail;
		this.empQq = empQq;
		this.empNational = empNational;
		this.empMarriage = empMarriage;
		this.empPoliticalVisage = empPoliticalVisage;
		this.empPhoto = empPhoto;
		this.empEducation = empEducation;
		this.empDegree = empDegree;
		this.empGraduationSchool = empGraduationSchool;
		this.empGraduationDate = empGraduationDate;
		this.empSpeciality = empSpeciality;
		this.empBankName = empBankName;
		this.empBankNumber = empBankNumber;
		this.empAccessionDate = empAccessionDate;
		this.empDimissionDate = empDimissionDate;
		this.empTitle = empTitle;
		this.empWage = empWage;
		this.remark = remark;
		this.workExperiences = workExperiences;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "empId", unique = true, nullable = false)
	public Integer getEmpId() {
		return this.empId;
	}

	public void setEmpId(Integer empId) {
		this.empId = empId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "deptId")
	public Dept getDept() {
		return this.dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "empWorkStateId")
	public EmployeeState getEmployeeState() {
		return this.employeeState;
	}


	public void setEmployeeState(EmployeeState employeeState) {
		this.employeeState = employeeState;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "postId")
	public Post getPost() {
		return this.post;
	}

	public void setPost(Post post) {
		this.post = post;
	}

	@Column(name = "empName", nullable = false, length = 50)
	public String getEmpName() {
		return this.empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	@Column(name = "empSex", nullable = false, length = 45)
	public String getEmpSex() {
		return this.empSex;
	}

	public void setEmpSex(String empSex) {
		this.empSex = empSex;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "empBirthday", length = 10)
	public Date getEmpBirthday() {
		return this.empBirthday;
	}

	public void setEmpBirthday(Date empBirthday) {
		this.empBirthday = empBirthday;
	}

	@Column(name = "empIdNumber", nullable = true, length = 50)
	public String getEmpIdNumber() {
		return this.empIdNumber;
	}

	public void setEmpIdNumber(String empIdNumber) {
		this.empIdNumber = empIdNumber;
	}
	@Column(name = "empAddress", length = 100)
	public String getEmpAddress() {
		return this.empAddress;
	}

	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}

	@Column(name = "empTel", length = 30)
	public String getEmpTel() {
		return this.empTel;
	}

	public void setEmpTel(String empTel) {
		this.empTel = empTel;
	}

	@Column(name = "empEmail", nullable = true, length = 50)
	public String getEmpEmail() {
		return this.empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	@Column(name = "empQQ", length = 30)
	public String getEmpQq() {
		return this.empQq;
	}

	public void setEmpQq(String empQq) {
		this.empQq = empQq;
	}

	@Column(name = "empNational", length = 50)
	public String getEmpNational() {
		return this.empNational;
	}

	public void setEmpNational(String empNational) {
		this.empNational = empNational;
	}
	
	@Column(name = "empNativePlace", length = 50)
	public String getEmpNativePlace() {
		return empNativePlace;
	}

	public void setEmpNativePlace(String empNativePlace) {
		this.empNativePlace = empNativePlace;
	}
	@Column(name = "empMarriage", length = 50)
	public String getEmpMarriage() {
		return this.empMarriage;
	}

	public void setEmpMarriage(String empMarriage) {
		this.empMarriage = empMarriage;
	}

	@Column(name = "empPoliticalVisage", length = 50)
	public String getEmpPoliticalVisage() {
		return this.empPoliticalVisage;
	}

	public void setEmpPoliticalVisage(String empPoliticalVisage) {
		this.empPoliticalVisage = empPoliticalVisage;
	}

	@Column(name = "empPhoto", length = 200)
	public String getEmpPhoto() {
		return this.empPhoto;
	}

	public void setEmpPhoto(String empPhoto) {
		this.empPhoto = empPhoto;
	}

	@Column(name = "empEducation", length = 100)
	public String getEmpEducation() {
		return this.empEducation;
	}

	public void setEmpEducation(String empEducation) {
		this.empEducation = empEducation;
	}
	
	@Column(name = "empDegree", length=100)
	public String getEmpDegree() {
		return empDegree;
	}

	public void setEmpDegree(String empDegree) {
		this.empDegree = empDegree;
	}
	@Column(name = "empGraduationSchool", length = 100)
	public String getEmpGraduationSchool() {
		return this.empGraduationSchool;
	}

	public void setEmpGraduationSchool(String empGraduationSchool) {
		this.empGraduationSchool = empGraduationSchool;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "empGraduationDate", length = 10)
	public Date getEmpGraduationDate() {
		return this.empGraduationDate;
	}

	public void setEmpGraduationDate(Date empGraduationDate) {
		this.empGraduationDate = empGraduationDate;
	}

	@Column(name = "empSpeciality", length = 50)
	public String getEmpSpeciality() {
		return this.empSpeciality;
	}

	public void setEmpSpeciality(String empSpeciality) {
		this.empSpeciality = empSpeciality;
	}

	@Column(name = "empBankName", length = 50)
	public String getEmpBankName() {
		return this.empBankName;
	}

	public void setEmpBankName(String empBankName) {
		this.empBankName = empBankName;
	}

	@Column(name = "empBankNumber", length = 50)
	public String getEmpBankNumber() {
		return this.empBankNumber;
	}

	public void setEmpBankNumber(String empBankNumber) {
		this.empBankNumber = empBankNumber;
	}

	@Column(name = "empAccessionDate", length = 19)
	public Date getEmpAccessionDate() {
		return this.empAccessionDate;
	}

	public void setEmpAccessionDate(Date empAccessionDate) {
		this.empAccessionDate = empAccessionDate;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "empDimissionDate", length = 10)
	public Date getEmpDimissionDate() {
		return this.empDimissionDate;
	}

	public void setEmpDimissionDate(Date empDimissionDate) {
		this.empDimissionDate = empDimissionDate;
	}

	@Column(name = "empTitle", length = 100)
	public String getEmpTitle() {
		return this.empTitle;
	}

	public void setEmpTitle(String empTitle) {
		this.empTitle = empTitle;
	}

	@Column(name = "empWage", precision = 12, scale = 0)
	public float getEmpWage() {
		return this.empWage;
	}

	public void setEmpWage(float empWage) {
		this.empWage = empWage;
	}

	@Column(name = "remark", length = 250)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "employee")
	public Set<WorkExperience> getWorkExperiences() {
		return this.workExperiences;
	}

	public void setWorkExperiences(Set<WorkExperience> workExperiences) {
		this.workExperiences = workExperiences;
	}
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "employee")
	public Set<EmployeeRedeploy> getEmployeeRedeploys() {
		return this.employeeRedeploys;
	}

	public void setEmployeeRedeploys(Set<EmployeeRedeploy> employeeRedeploys) {
		this.employeeRedeploys = employeeRedeploys;
	}
}