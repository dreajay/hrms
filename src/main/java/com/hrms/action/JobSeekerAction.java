package com.hrms.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.hrms.model.JobSeeker;
import com.hrms.model.Recruit;
import com.hrms.service.IJobSeekerService;
import com.hrms.service.IRecruitService;
import com.hrms.util.Page;
import com.hrms.util.StringUtil;
import com.hrms.util.UploadUtil;

@Component("jobSeekerAction")
@Scope("prototype")
public class JobSeekerAction extends BaseAction {
	private static final long serialVersionUID = -2755386842167958611L;
	private Integer jobSeekerId;
	private JobSeeker jobSeeker;
	private IJobSeekerService jobSeekerService;
	private IRecruitService recruitService;
	private Recruit recruit;
	private Integer recruitId;
	private List<JobSeeker> jobSeekers;
	private Page page;
	private int currentPage = 1;
	private int bufferSize = 12 * 1024;
	private File registrationForm;
	private File resume;
	private String registrationFormFileName;
	private String resumeFileName;
	private String registrationFormContentType;
	private String resumeContentType;
	private String savePath = UploadUtil.getSavePath();
	private InputStream inputStream;
	private String fileName;
	private String errorMessage;
	
	public Object jobSeeker_scan() {
		fileName = StringUtil.getZhStr(fileName);
		File dst = new File(savePath + File.separator + fileName);
		if(dst.isFile()) {
			return "success";
		}
		getRequest().setAttribute("errorMessage", "没有找到相关文件,不能预览！");
		getRequest().setAttribute("forwardLink", "jobSeeker?recruitId=" + recruitId + "&currentPage=" + currentPage);
		return "error";
		
	}
	public InputStream getInputStream() {
		try {
			inputStream = new BufferedInputStream(new FileInputStream(savePath + File.separator + StringUtil.getZhStr(fileName)));
		} catch (FileNotFoundException e) {
			System.out.println("JobSeeker:没有找到相关文件,不能预览");
			//e.printStackTrace();
		}
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String jobSeeker_list() {
		recruit = recruitService.findById(recruitId);
		int totalSzie = recruit.getJobSeekers().size();
		this.page = new Page(currentPage, totalSzie);
		jobSeekers = jobSeekerService.findAllByPage(
				"from JobSeeker js where js.recruit.recruitId=" + recruitId,
				currentPage, page.getPageSize());
		return "success";
	}

	public String jobSeeker_upload() {
		jobSeeker = jobSeekerService.findById(jobSeekerId);
		Integer id = jobSeeker.getJobSeekerId();
		String name = jobSeeker.getJobSeekerName();
		String dstName = "";
		if (registrationForm != null) {
			dstName = UploadUtil.setFileName(id + name + "registrationForm.doc");
			saveFile(registrationForm, dstName);
			jobSeeker.setJobSeekerRegistrationForm(dstName);
		}
		if (resume != null) {
			dstName = UploadUtil.setFileName(id + name + "resume.doc");
			saveFile(resume, dstName);
			jobSeeker.setJobSeekerResume(dstName);
		}
		jobSeekerService.update(jobSeeker);
		return "success";
	}

	public void saveFile(File src,String dstName) {
		System.out.println(dstName);
		String dstFile = UploadUtil.getSavePath() + File.separator + dstName;
		File dst = new File(dstFile);
		InputStream in = null;
		OutputStream out = null;
		try {
			in = new BufferedInputStream(new FileInputStream(src), bufferSize);
			out = new BufferedOutputStream(new FileOutputStream(dst),bufferSize);
			byte[] buffer = new byte[bufferSize];
			while (in.read(buffer) > 0) {
				out.write(buffer);
			}
		} catch (FileNotFoundException e) {
			System.out.println("jobSeekerAction:文件找不到");
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if(out != null)
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			if(in != null)
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
	}

	public String recruit_add() {
		/*
		 * request = getRequest(); String addAction =
		 * request.getParameter("addAction"); if (addAction == null) { User user
		 * = (User) getSession().getAttribute("user"); Integer empId =
		 * user.getEmpId(); Employee employee = employeeService.findById(empId);
		 * getRequest().setAttribute("employee", employee); return "add"; }
		 * recruitService.saveOrUpdate(recruit);
		 */
		return "success";
	}

	public String recruit_update() {
		/*
		 * request = getRequest(); recruit = recruitService.findById(recruitId);
		 * String state = recruit.getState(); if (state != null &&
		 * !state.equals("未提交")) { request.setAttribute("errorMessage",
		 * "该申请已提交审批流程中，不需再提交，也不能修改和删除！"); request.setAttribute("forwardLink",
		 * "recruit_my?currentPage="+ currentPage); return "error"; } String
		 * update = getRequest().getParameter("update"); if (update != null &&
		 * update.equals("update")) { recruitService.update(recruit); return
		 * "success"; } else if (recruitId != null) { recruit =
		 * recruitService.findById(recruitId); return "update"; } else { return
		 * "error"; }
		 */
		return "error";
	}

	public String recruit_delete() {
		/*
		 * request = getRequest(); recruit = recruitService.findById(recruitId);
		 * String state = recruit.getState(); if (state != null &&
		 * !state.equals("未提交")) { request.setAttribute("errorMessage",
		 * "该申请已提交审批流程中，不需再提交，也不能修改和删除！"); request.setAttribute("forwardLink",
		 * "recruit_my?currentPage="+ currentPage); return "error"; } if
		 * (recruitId != null) { recruitService.deleteById(recruitId); return
		 * "success"; }
		 */
		return "error";
	}

	public IRecruitService getRecruitService() {
		return recruitService;
	}

	@Resource
	public void setRecruitService(IRecruitService recruitService) {
		this.recruitService = recruitService;
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

	public Integer getJobSeekerId() {
		return jobSeekerId;
	}

	public void setJobSeekerId(Integer jobSeekerId) {
		this.jobSeekerId = jobSeekerId;
	}

	public JobSeeker getJobSeeker() {
		return jobSeeker;
	}

	public void setJobSeeker(JobSeeker jobSeeker) {
		this.jobSeeker = jobSeeker;
	}

	public IJobSeekerService getJobSeekerService() {
		return jobSeekerService;
	}

	@Resource
	public void setJobSeekerService(IJobSeekerService jobSeekerService) {
		this.jobSeekerService = jobSeekerService;
	}

	public List<JobSeeker> getJobSeekers() {
		return jobSeekers;
	}

	public void setJobSeekers(List<JobSeeker> jobSeekers) {
		this.jobSeekers = jobSeekers;
	}

	public Recruit getRecruit() {
		return recruit;
	}

	public void setRecruit(Recruit recruit) {
		this.recruit = recruit;
	}

	public Integer getRecruitId() {
		return recruitId;
	}

	public void setRecruitId(Integer recruitId) {
		this.recruitId = recruitId;
	}
	public int getBufferSize() {
		return bufferSize;
	}

	public void setBufferSize(int bufferSize) {
		this.bufferSize = bufferSize;
	}

	public File getRegistrationForm() {
		return registrationForm;
	}

	public void setRegistrationForm(File registrationForm) {
		this.registrationForm = registrationForm;
	}

	public File getResume() {
		return resume;
	}

	public void setResume(File resume) {
		this.resume = resume;
	}
	public String getRegistrationFormFileName() {
		return registrationFormFileName;
	}

	public void setRegistrationFormFileName(String registrationFormFileName) {
		this.registrationFormFileName = registrationFormFileName;
	}

	public String getResumeFileName() {
		return resumeFileName;
	}

	public void setResumeFileName(String resumeFileName) {
		this.resumeFileName = resumeFileName;
	}

	public String getRegistrationFormContentType() {
		return registrationFormContentType;
	}

	public void setRegistrationFormContentType(String registrationFormContentType) {
		this.registrationFormContentType = registrationFormContentType;
	}

	public String getResumeContentType() {
		return resumeContentType;
	}

	public void setResumeContentType(String resumeContentType) {
		this.resumeContentType = resumeContentType;
	}
	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getErrorMessage() {
		return errorMessage;
	}
	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}
}
