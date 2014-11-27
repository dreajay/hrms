package com.hrms.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.hrms.model.Post;
import com.hrms.service.IPostService;
import com.hrms.util.Page;


@Component("postAction")
@Scope("prototype")
public class PostAction extends BaseAction {
	private static final long serialVersionUID = -2585267116940836859L;
	private Post post;
	private Post parentPost;
	private Integer postId;
	private List<Post> posts;
	private IPostService postService;
	private Page page;
	private int currentPage=1;
	
	public String post_list() {
		int totalSzie = postService.getSize();
		this.page = new Page(currentPage, totalSzie);
		posts = postService.getListByPage(currentPage, page.getPageSize());
		getSession().setAttribute("posts", posts);
		return "success";
	}
	public String post_add() {
		String addAction = getRequest().getParameter("addAction");
		if (addAction==null) {
			return "add";
		}
		Integer parentId = postId;
		post.setPostId(null);
		post.setParentPost(postService.findById(parentId));
		postService.saveOrUpdate(post);
		if(addAction!=null && addAction.equals("2")) {
			return "adds";
		} 
		return "success";
	}
	public String post_update() {
		String update = getRequest().getParameter("update");
		if(update != null && update.equals("update")) {
			String selParentId = getRequest().getParameter("selParent");
			Integer parentId;
			if (selParentId != null && !selParentId.equals("")) {
				parentId= Integer.valueOf(selParentId);
				post.setParentPost(postService.findById(parentId));
			}
			postService.update(post);
			return "success";
		}else if(postId != null) {
			post = postService.findById(postId);
			parentPost = post.getParentPost();
			return "update";
		} else {
			return "error";
		}
		
	}
	public String post_delete() {
		postService.deleteById(getPostId());
		return "success";
	}
	
	
	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	public Post getParentPost() {
		return parentPost;
	}
	public void setParentPost(Post parentPost) {
		this.parentPost = parentPost;
	}
	public Integer getPostId() {
		return postId;
	}
	public void setPostId(Integer postId) {
		this.postId = postId;
	}
	public List<Post> getPosts() {
		return posts;
	}
	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}
	public IPostService getPostService() {
		return postService;
	}
	@Resource
	public void setPostService(IPostService postService) {
		this.postService = postService;
	}
}
