package com.ssafy.happyhouse.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.ssafy.happyhouse.model.MemberDto;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	@SuppressWarnings("null")
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) 
			throws Exception {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		if(memberDto != null) {
			if(memberDto.getUserType() != 1) {
				System.out.println(request.getContextPath());
				response.sendRedirect(request.getContextPath());
				return false;
			}
		}else {
			System.out.println(request.getContextPath());
			response.sendRedirect(request.getContextPath());
			return false;
		}
		
		return true;
	}
}
