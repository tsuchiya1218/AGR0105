package com.gogocar.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gogocar.bean.User;
import com.gogocar.service.UserService;


@Controller
public class UserController {
	 
	 @Autowired
	 UserService userService;
	
	 
		/*
		 * @RequestMapping(value = "/regist",method = RequestMethod.POST ) public String
		 * regist(HttpServletRequest request) { if (userService.regist(new User(null,
		 * request.getParameter("username"), request.getParameter("password"),
		 * request.getParameter("email"), request.getParameter("address")))==1){ return
		 * "success"; }else { return "fail"; }
		 * 
		 * }
		 */
	
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String checkLogin(HttpServletRequest request,HttpSession session,Model model) {
		User user = userService.Logincheck(request.getParameter("username"), request.getParameter("password"));
		if (user!=null) {
			model.addAttribute("user", user);
			session.setAttribute("user", user);
			return "index";
		}else {
			model.addAttribute("msg", "パスワードが間違っている、もう一度入力してください!");
			return "Login";
		}
	}
	
	@RequestMapping(value = "userinfo",method = RequestMethod.GET)
	public String showUser(HttpSession session) {
		User user=(User)session.getAttribute("user");
		if (user!=null) {
			return "Userinfo";
		}else {
			return "index";
		}
		
	}
	
	@RequestMapping(value = "/logout",method = RequestMethod.GET)
	public String logout(HttpSession session) {
		if(session.getAttribute("user")!=null) {
			
			session.invalidate();
			return "index";
		}
		return "Login";
	}
	
}
