package com.hrms.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.hrms.model.Traintype;
import com.hrms.service.ITraintypeService;
import com.hrms.util.Page;


@Component("traintypeAction")
@Scope("prototype")
public class TraintypeAction extends BaseAction {
	private static final long serialVersionUID = 707835217939557549L;
	private Traintype traintype;
	private Integer trainTypeId;
	private List<Traintype> traintypes;
	private ITraintypeService traintypeService;
	private Page page;
	private int currentPage=1;
	
	public String traintype_list() {
		int totalSzie = traintypeService.getSize();
		this.page = new Page(currentPage, totalSzie);
		traintypes = traintypeService.getListByPage(currentPage, page.getPageSize());
		getSession().setAttribute("traintypes", traintypes);
		return "success";
	}
	public String traintype_add() {
		String addAction = getRequest().getParameter("addAction");
		if (addAction==null) {
			return "add";
		}
		traintype.setTrainTypeId(null);
		traintypeService.saveOrUpdate(traintype);
		if(addAction!=null && addAction.equals("2")) {
			return "adds";
		} 
		return "success";
	}
	public String traintype_update() {
		String update = getRequest().getParameter("update");
		if(update != null && update.equals("update")) {
			traintypeService.update(traintype);
			return "success";
		}else if(trainTypeId != null) {
			traintype = traintypeService.findById(trainTypeId);
			return "update";
		} else {
			return "error";
		}
		
	}
	public String traintype_delete() {
		traintypeService.deleteById(getTrainTypeId());
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

	public List<Traintype> getTraintypes() {
		return traintypes;
	}
	public void setTraintypes(List<Traintype> traintypes) {
		this.traintypes = traintypes;
	}
	public ITraintypeService getTraintypeService() {
		return traintypeService;
	}
	@Resource
	public void setTraintypeService(ITraintypeService traintypeService) {
		this.traintypeService = traintypeService;
	}
	public Traintype getTraintype() {
		return traintype;
	}
	public void setTraintype(Traintype traintype) {
		this.traintype = traintype;
	}
	public Integer getTrainTypeId() {
		return trainTypeId;
	}
	public void setTrainTypeId(Integer trainTypeId) {
		this.trainTypeId = trainTypeId;
	}
}
