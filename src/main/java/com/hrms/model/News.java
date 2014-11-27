package com.hrms.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * News entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "news", catalog = "hrms")
public class News implements java.io.Serializable {

	// Fields
	private static final long serialVersionUID = 1L;
	private Integer newsId;
	private String newsTitle;
	private String newsContent;
	private Date publishDate;
	private String publisher;
	private String remark;

	// Constructors

	/** default constructor */
	public News() {
	}

	/** minimal constructor */
	public News(String newsTitle, String newsContent, Date publishDate,
			String publisher) {
		this.newsTitle = newsTitle;
		this.newsContent = newsContent;
		this.publishDate = publishDate;
		this.publisher = publisher;
	}

	/** full constructor */
	public News(String newsTitle, String newsContent, Date publishDate,
			String publisher, String remark) {
		this.newsTitle = newsTitle;
		this.newsContent = newsContent;
		this.publishDate = publishDate;
		this.publisher = publisher;
		this.remark = remark;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "newsId", unique = true, nullable = false)
	public Integer getNewsId() {
		return this.newsId;
	}

	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
	}

	@Column(name = "newsTitle", nullable = false, length = 50)
	public String getNewsTitle() {
		return this.newsTitle;
	}

	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}

	@Column(name = "newsContent", nullable = false, length = 65535)
	public String getNewsContent() {
		return this.newsContent;
	}

	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}

	@Column(name = "publishDate", nullable = false, length = 19)
	public Date getPublishDate() {
		return this.publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	@Column(name = "publisher", nullable = false, length = 250)
	public String getPublisher() {
		return this.publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	@Column(name = "remark", length = 250)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

}