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
 * Traintype entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "traintype", catalog = "hrms")
public class Traintype implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = -4010865627908936857L;
	private Integer trainTypeId;
	private String trainType;
	private String remark;
	private Set<Train> trains = new HashSet<Train>(0);

	// Constructors

	/** default constructor */
	public Traintype() {
	}

	/** minimal constructor */
	public Traintype(String trainType) {
		this.trainType = trainType;
	}

	/** full constructor */
	public Traintype(String trainType, String remark, Set<Train> trains) {
		this.trainType = trainType;
		this.remark = remark;
		this.trains = trains;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "trainTypeId", unique = true, nullable = false)
	public Integer getTrainTypeId() {
		return this.trainTypeId;
	}

	public void setTrainTypeId(Integer trainTypeId) {
		this.trainTypeId = trainTypeId;
	}

	@Column(name = "trainType", nullable = false, length = 45)
	public String getTrainType() {
		return this.trainType;
	}

	public void setTrainType(String trainType) {
		this.trainType = trainType;
	}

	@Column(name = "remark", length = 65535)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "traintype")
	public Set<Train> getTrains() {
		return this.trains;
	}

	public void setTrains(Set<Train> trains) {
		this.trains = trains;
	}

}