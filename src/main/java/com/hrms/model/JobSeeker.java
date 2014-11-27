package com.hrms.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Dept entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "jobseeker", catalog="hrms")
public class JobSeeker implements java.io.Serializable {

	private static final long serialVersionUID = 6025866027330499086L;
	// Fields
	private Integer jobSeekerId;
	private Recruit recruit;
	private String jobSeekerName;
	private String jobSeekerSex;
	private String jobSeekerGraduationSchool;
	private String jobSeekerEducation;
	private String jobSeekerTel;
	private String jobSeekerEmail;
	private String jobSeekerRegistrationForm;
	private String jobSeekerResume;
	
	// Constructors

	/** default constructor */
	public JobSeeker() {
	}

	public JobSeeker(Integer jobSeekerId,Recruit recruit,String jobSeekerName,String jobSeekerSex,
			String jobSeekerGraduationSchool,String jobSeekerEducation,String jobSeekerTel,
			String jobSeekerEmail,String jobSeekerRegistrationForm,String jobSeekerResume) {
		this.jobSeekerId = jobSeekerId;
		this.recruit = recruit;
		this.jobSeekerName = jobSeekerName;
		this.jobSeekerSex = jobSeekerSex;
		this.jobSeekerGraduationSchool = jobSeekerGraduationSchool;
		this.jobSeekerEducation = jobSeekerEducation;
		this.jobSeekerTel = jobSeekerTel;
		this.jobSeekerEmail = jobSeekerEmail;
		this.jobSeekerRegistrationForm = jobSeekerRegistrationForm;
		this.jobSeekerResume = jobSeekerResume;
	}
	@Id
	@GeneratedValue
	@Column(name = "jobSeekerId", unique = true, nullable = false)
	public Integer getJobSeekerId() {
		return jobSeekerId;
	}

	public void setJobSeekerId(Integer jobSeekerId) {
		this.jobSeekerId = jobSeekerId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "recruitId")
	public Recruit getRecruit() {
		return recruit;
	}

	public void setRecruit(Recruit recruit) {
		this.recruit = recruit;
	}

	@Column(name = "jobSeekerName", nullable = false, length = 10)
	public String getJobSeekerName() {
		return jobSeekerName;
	}

	public void setJobSeekerName(String jobSeekerName) {
		this.jobSeekerName = jobSeekerName;
	}
	@Column(name = "jobSeekerSex", nullable = false, length = 5)
	public String getJobSeekerSex() {
		return jobSeekerSex;
	}

	public void setJobSeekerSex(String jobSeekerSex) {
		this.jobSeekerSex = jobSeekerSex;
	}

	@Column(name = "jobSeekerGraduationSchool", nullable = true, length = 30)
	public String getJobSeekerGraduationSchool() {
		return jobSeekerGraduationSchool;
	}

	public void setJobSeekerGraduationSchool(String jobSeekerGraduationSchool) {
		this.jobSeekerGraduationSchool = jobSeekerGraduationSchool;
	}
	
	@Column(name = "jobSeekerEducation", nullable = true, length = 10)
	public String getJobSeekerEducation() {
		return jobSeekerEducation;
	}

	public void setJobSeekerEducation(String jobSeekerEducation) {
		this.jobSeekerEducation = jobSeekerEducation;
	}

	@Column(name = "jobSeekerTel", nullable = false, length = 20)
	public String getJobSeekerTel() {
		return jobSeekerTel;
	}

	public void setJobSeekerTel(String jobSeekerTel) {
		this.jobSeekerTel = jobSeekerTel;
	}

	@Column(name = "jobSeekerEmail", nullable = true, length = 30)
	public String getJobSeekerEmail() {
		return jobSeekerEmail;
	}

	public void setJobSeekerEmail(String jobSeekerEmail) {
		this.jobSeekerEmail = jobSeekerEmail;
	}

	@Column(name = "jobSeekerRegistrationForm", nullable = true, length = 500)
	public String getJobSeekerRegistrationForm() {
		return jobSeekerRegistrationForm;
	}

	public void setJobSeekerRegistrationForm(String jobSeekerRegistrationForm) {
		this.jobSeekerRegistrationForm = jobSeekerRegistrationForm;
	}

	@Column(name = "jobSeekerResume", nullable = true, length = 500)
	public String getJobSeekerResume() {
		return jobSeekerResume;
	}

	public void setJobSeekerResume(String jobSeekerResume) {
		this.jobSeekerResume = jobSeekerResume;
	}

}