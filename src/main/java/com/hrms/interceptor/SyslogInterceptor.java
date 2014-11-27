package com.hrms.interceptor;

import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.StrutsStatics;
import org.springframework.stereotype.Component;


import com.hrms.model.Module;
import com.hrms.model.Syslog;
import com.hrms.service.IActionService;
import com.hrms.service.IModuleService;
import com.hrms.service.ISyslogService;
import com.hrms.service.IUserPermissionService;
import com.hrms.service.IUserService;
import com.hrms.model.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

@Component
public class SyslogInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = -5779828224710405013L;
	private IUserPermissionService userPermissionService;
	private IModuleService moduleService;
	private ISyslogService syslogService;
	private IActionService actionService;
	private IUserService userService;
	

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		Syslog syslog = new Syslog();
		ActionContext actionContext = actionInvocation.getInvocationContext();
		HttpServletRequest request = (HttpServletRequest) actionContext.get(StrutsStatics.HTTP_REQUEST);
		String accessIp = getIpAddr(request);
		syslog.setAccessIp(accessIp);
		StringBuffer url = request.getRequestURL();
		
		int slash = url.lastIndexOf("/");
		String linkUrl = url.substring(slash+1);
		int point = linkUrl.lastIndexOf(".");
		if (point>0) {
			linkUrl = linkUrl.substring(0,point);
		}
		int bottomLine = linkUrl.lastIndexOf("_");
		String result;
		String userId;
		String actionId = "1";
		String actionStr = linkUrl.substring(linkUrl.lastIndexOf("_")+1);
		if(actionStr.equals("add")) {
			actionId = "2";
		} else if (actionStr.equals("update")) {
			actionId = "3";
		}else if (actionStr.equals("delete")) {
			actionId = "4";
		}
		
		if(linkUrl.equals("user_login")) {
			syslog.setAction("登入");
			result = actionInvocation.invoke();
			userId = actionContext.getSession().get("userId").toString();
		}else {
			userId = actionContext.getSession().get("userId").toString();
			if(linkUrl.equals("user_loginOut")) {
				syslog.setAction("退出");
			}else {
				if (actionId != null && actionId.trim() != "") {
					Action action = (Action) actionService.findById(Integer.valueOf(actionId));
					if (action!=null) {
						syslog.setAction(action.getAction());
					}
				}
			}
			result = actionInvocation.invoke();
		}
		if (bottomLine>0) {
			linkUrl = linkUrl.substring(0,bottomLine);
		}
		if (userId != null && actionId != null && !actionId.equals("1")) {
			syslog.setDate(new Date());
			Module module = moduleService.getModuleByLinkUrl(linkUrl);
			syslog.setModule(module);
			if (result.equals("error")) {
				syslog.setType("错误");
			} else if((result.equals("input"))){
				syslog.setType("警告");
			} else {
				syslog.setType("信息");
			}
			syslog.setUser(userService.findById(Integer.valueOf(userId)));
			if (result.equals("success") || result.equals("error") || result.equals("input")) {
				syslogService.save(syslog);
			}
			return result;
		}
		return "login";
	}

	public String getIpAddr(HttpServletRequest request) {   
        String ip = request.getHeader("X-Forwarded-For");   
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {   
            ip = request.getHeader("Proxy-Client-IP");   
        }   
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {   
            ip = request.getHeader("WL-Proxy-Client-IP");   
        }   
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {   
            ip = request.getHeader("HTTP_CLIENT_IP");   
        }   
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {   
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");   
        }   
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {   
            ip = request.getRemoteAddr();   
        }   
        return ip;   
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
	public ISyslogService getSyslogService() {
		return syslogService;
	}
	@Resource
	public void setSyslogService(ISyslogService syslogService) {
		this.syslogService = syslogService;
	}
	public IActionService getActionService() {
		return actionService;
	}
	@Resource
	public void setActionService(IActionService actionService) {
		this.actionService = actionService;
	}
	public IUserService getUserService() {
		return userService;
	}
	@Resource
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}
}
