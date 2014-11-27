package com.hrms.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.hrms.model.Train;
import com.hrms.model.Traintype;
import com.hrms.service.ITrainService;
import com.hrms.service.ITraintypeService;
import com.hrms.util.Page;


@Component("trainAction")
@Scope("prototype")
public class TrainAction extends BaseAction {
	private static final long serialVersionUID = 707835217939557549L;
	private Train train;
	private List<Train> trains;
	private List<Traintype> traintypes;
	private Integer trainTypeId;
	private Integer trainId;
	private ITrainService trainService;
	private ITraintypeService traintypeService;
	private Page page;
	private int currentPage=1;
	
	public String train_list() {
		int totalSzie = trainService.getSize();
		this.page = new Page(currentPage, totalSzie);
		trains = trainService.getListByPage(currentPage, page.getPageSize());
		getSession().setAttribute("trains", trains);
		return "success";
	}
	public String train_add() {
		String addAction = getRequest().getParameter("addAction");
		traintypes = traintypeService.findAll();
		if (addAction==null) {
			return "add";
		}
		train.setTrainId(null);
		if (trainTypeId != null) {
			train.setTraintype(traintypeService.findById(trainTypeId));
		}
		trainService.saveOrUpdate(train);
		if(addAction!=null && addAction.equals("2")) {
			addActionMessage("添加成功");
			return "adds";
		} 
		return "success";
	}
	public String train_update() {
		String update = getRequest().getParameter("update");
		if(update != null && update.equals("update")) {
			if (trainTypeId != null) {
				train.setTraintype(traintypeService.findById(trainTypeId));
			}
			trainService.update(train);
			return "success";
		}else if(trainId != null) {
			train = trainService.findById(trainId);
			traintypes = traintypeService.findAll();
			return "update";
		} else {
			return "error";
		}
		
	}
	public String train_detail() {
		if(trainId != null) {
			train = trainService.findById(trainId);
			traintypes = traintypeService.findAll();
			return "success";
		} else {
			return "error";
		}
	}
	public String train_delete() {
		trainService.deleteById(getTrainId());
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

	public Train getTrain() {
		return train;
	}
	public void setTrain(Train train) {
		this.train = train;
	}
	public List<Train> getTrains() {
		return trains;
	}
	public void setTrains(List<Train> trains) {
		this.trains = trains;
	}
	public Integer getTrainId() {
		return trainId;
	}
	public void setTrainId(Integer trainId) {
		this.trainId = trainId;
	}
	public ITrainService getTrainService() {
		return trainService;
	}
	@Resource
	public void setTrainService(ITrainService trainService) {
		this.trainService = trainService;
	}
	public List<Traintype> getTraintypes() {
		return traintypes;
	}
	public void setTraintypes(List<Traintype> traintypes) {
		this.traintypes = traintypes;
	}
	public Integer getTrainTypeId() {
		return trainTypeId;
	}
	public void setTrainTypeId(Integer trainTypeId) {
		this.trainTypeId = trainTypeId;
	}
	public ITraintypeService getTraintypeService() {
		return traintypeService;
	}
	@Resource
	public void setTraintypeService(ITraintypeService traintypeService) {
		this.traintypeService = traintypeService;
	}
}
