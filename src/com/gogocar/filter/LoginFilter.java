package com.gogocar.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request =(HttpServletRequest)arg0;
		HttpServletResponse response =(HttpServletResponse)arg1;
		HttpSession session = request.getSession();
		if(request.getRequestURI().equals("/GoGoCar/user/login")){
			chain.doFilter(request, response);
		}else if(session.getAttribute("user")==null&&request.getRequestURI().indexOf("/user/userLogin.jsp")==-1) {
			System.out.println(request.getRequestURI());
			response.sendRedirect(request.getContextPath()+"/user/userLogin.jsp");
			
		}else {
			chain.doFilter(request, response);
		}
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
