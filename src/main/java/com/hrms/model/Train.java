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

/**
 * Train entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "train", catalog = "hrms")
public class Train implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 26477328393037521L;
	private Integer trainId;
	private Traintype traintype;
	private String trainCourse;
	private String trainContent;
	private String trainUnit;
	private String trainEmployee;
	private String trainTutor;
	private String trainTarget;
	private Date trainStartDate;
	private Date trainEndDate;
	private String trainResult;
	private String remark;

	// Constructors

	/** default constructor */
	public Train() {
	}

	/** minimal constructor */
	public Train(String trainCourse) {
		this.trainCourse = trainCourse;
	}

	/** full constructor */
	public Train(Traintype traintype, String trainCourse, String trainContent,
			String trainUnit, String trainEmployee, String trainTutor,
			String trainTarget, Date trainStartDate,
			Date trainEndDate, String trainResult, String remark) {
		this.traintype = traintype;
		this.trainCourse = trainCourse;
		this.trainContent = trainContent;
		this.trainUnit = trainUnit;
		this.trainEmployee = trainEmployee;
		this.trainTutor = trainTutor;
		this.trainTarget = trainTarget;
		this.trainStartDate = trainStartDate;
		this.trainEndDate = trainEndDate;
		this.trainResult = trainResult;
		this.remark = remark;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "trainId", unique = true, nullable = false)
	public Integer getTrainId() {
		return this.trainId;
	}

	public void setTrainId(Integer trainId) {
		this.trainId = trainId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "trainTypeId")
	public Traintype getTraintype() {
		return this.traintype;
	}

	public void setTraintype(Traintype traintype) {
		this.traintype = traintype;
	}

	@Column(name = "trainCourse", nullable = false, length = 250)
	public String getTrainCourse() {
		return this.trainCourse;
	}

	public void setTrainCourse(String trainCourse) {
		this.trainCourse = trainCourse;
	}

	@Column(name = "trainContent", length = 65535)
	public String getTrainContent() {
		return this.trainContent;
	}

	public void setTrainContent(String trainContent) {
		this.trainContent = trainContent;
	}

	@Column(name = "trainUnit", length = 250)
	public String getTrainUnit() {
		return this.trainUnit;
	}

	public void setTrainUnit(String trainUnit) {
		this.trainUnit = trainUnit;
	}

	@Column(name = "trainEmployee", length = 500)
	public String getTrainEmployee() {
		return this.trainEmployee;
	}

	public void setTrainEmployee(String trainEmployee) {
		this.trainEmployee = trainEmployee;
	}

	@Column(name = "trainTutor", length = 250)
	public String getTrainTutor() {
		return this.trainTutor;
	}

	public void setTrainTutor(String trainTutor) {
		this.trainTutor = trainTutor;
	}

	@Column(name = "trainTarget", length = 500)
	public String getTrainTarget() {
		return this.trainTarget;
	}

	public void setTrainTarget(String trainTarget) {
		this.trainTarget = trainTarget;
	}

	@Column(name = "trainStartDate", length = 19)
	public Date getTrainStartDate() {
		return this.trainStartDate;
	}

	public void setTrainStartDate(Date trainStartDate) {
		this.trainStartDate = trainStartDate;
	}

	@Column(name = "trainEndDate", length = 19)
	public Date getTrainEndDate() {
		return this.trainEndDate;
	}

	public void setTrainEndDate(Date trainEndDate) {
		this.trainEndDate = trainEndDate;
	}

	@Column(name = "trainResult", length = 250)
	public String getTrainResult() {
		return this.trainResult;
	}

	public void setTrainResult(String trainResult) {
		this.trainResult = trainResult;
	}

	@Column(name = "remark", length = 250)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}