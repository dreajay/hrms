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
 * Post entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "post", catalog = "hrms")
public class Post implements java.io.Serializable {

	// Fields

	private static final long serialVersionUID = 2235911878396421289L;
	private Integer postId;
	private Post parentPost;
	private String postName;
	private String postResponsibility;
	private float postSalary;
	private String remark;
	private Set<Post> posts = new HashSet<Post>(0);
	private Set<Employee> employees = new HashSet<Employee>(0);
	private Set<EmployeeRedeploy> employeeRedeploys = new HashSet<EmployeeRedeploy>(0);
	
	// Constructors

	/** default constructor */
	public Post() {
	}

	/** minimal constructor */
	public Post(String postName, String postResponsibility, float postSalary) {
		this.postName = postName;
		this.postResponsibility = postResponsibility;
		this.postSalary = postSalary;
	}

	/** full constructor */
	public Post(Post parentPost, String postName, String postResponsibility,
			float postSalary, String remark, Set<Post> posts,
			Set<Employee> employees) {
		this.parentPost = parentPost;
		this.postName = postName;
		this.postResponsibility = postResponsibility;
		this.postSalary = postSalary;
		this.remark = remark;
		this.posts = posts;
		this.employees = employees;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "postId", unique = true, nullable = false)
	public Integer getPostId() {
		return this.postId;
	}

	public void setPostId(Integer postId) {
		this.postId = postId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "parentPostId")
	public Post getParentPost() {
		return this.parentPost;
	}

	public void setParentPost(Post parentPost) {
		this.parentPost = parentPost;
	}

	@Column(name = "postName", nullable = false, length = 50)
	public String getPostName() {
		return this.postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

	@Column(name = "postResponsibility", nullable = false, length = 250)
	public String getPostResponsibility() {
		return this.postResponsibility;
	}

	public void setPostResponsibility(String postResponsibility) {
		this.postResponsibility = postResponsibility;
	}

	@Column(name = "postSalary", nullable = false, precision = 12, scale = 0)
	public float getPostSalary() {
		return this.postSalary;
	}

	public void setPostSalary(float postSalary) {
		this.postSalary = postSalary;
	}

	@Column(name = "remark", length = 250)
	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "parentPost")
	public Set<Post> getPosts() {
		return this.posts;
	}

	public void setPosts(Set<Post> posts) {
		this.posts = posts;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "post")
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