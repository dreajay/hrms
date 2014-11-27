package com.hrms.interceptor;


import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class UserLoginInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = -8812785944870674844L;
	
	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
	ActionContext actionContext = actionInvocation.getInvocationContext();
	  Object user = actionContext.getSession().get("user");   
      if(user != null){   
           return actionInvocation.invoke();   
      } else{
    	  actionContext.put("loginMessage", "您尚未登陆,请先登陆");
          return Action.LOGIN;   
      }   

	}

}
