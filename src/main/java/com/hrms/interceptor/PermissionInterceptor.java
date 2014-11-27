package com.hrms.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;
import org.springframework.stereotype.Component;

import com.hrms.model.Module;
import com.hrms.service.IModuleService;
import com.hrms.service.IUserPermissionService;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@Component
public class PermissionInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = -5779828224710405013L;
	private IUserPermissionService userPermissionService;
	private IModuleService moduleService;

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		ActionContext actionContext = actionInvocation.getInvocationContext();
		HttpServletRequest request = (HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
		String userId = actionContext.getSession().get("userId").toString();
		String contextPath = request.getContextPath();
		StringBuffer url = request.getRequestURL();
		int contextPathPost = url.lastIndexOf(contextPath);
		int contextPathLength = contextPath.length();
		String linkUrl = url.substring(contextPathPost + contextPathLength + 1);
		String actionId = "";
		int bottomLine = linkUrl.lastIndexOf("_");
		String action = linkUrl.substring(bottomLine+1);
		if(bottomLine < 0 || action.equals("my")) {
			actionId = "1";
		} else if(action.equals("add")) {
			actionId = "2";
		} else if (action.equals("update")) {
			actionId = "3";
		}else if (action.equals("delete")) {
			actionId = "4";
		} else if (action.equals("approverList") || action.equals("transactorList")) {
			actionId = "5";
		} else {
			actionId = "6";
		}
		if (bottomLine>0) {
			linkUrl = linkUrl.substring(0,bottomLine);
		}
		Module module = moduleService.getModuleByLinkUrl(linkUrl);
		if (userId != null && module!=null) {
			String moduleId = module.getModuleId().toString();
			if (userPermissionService.checkPermission(userId, moduleId,actionId)) {
				return actionInvocation.invoke();
			}
		}
		if (module==null) {
			return actionInvocation.invoke();
		}
		actionContext.put("permissionMessage", "你没有该权限,请先登陆");
		return Action.NONE;
	}
	
	public IModuleService getModuleService() {
		return moduleService;
	}
	@Resource
	public void setModuleService(IModuleService moduleService) {
		this.moduleService = moduleService;
	}

	public IUserPermissionService getUserPermissionService() {
		return userPermissionService;
	}

	@Resource
	public void setUserPermissionService(IUserPermissionService userPermissionService) {
		this.userPermissionService = userPermissionService;
	}
}
