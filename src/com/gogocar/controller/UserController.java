package com.gogocar.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gogocar.bean.Car;
import com.gogocar.bean.User;
import com.gogocar.service.CarService;
import com.gogocar.service.UserService;

@RequestMapping("/user")
@Controller
public class UserController {
	 
	 @Autowired
	 UserService userService;
	 
	 @Autowired
	 CarService carService;
	 
		/*
		 * @RequestMapping(value = "/regist",method = RequestMethod.POST ) public String
		 * regist(HttpServletRequest request) { if (userService.regist(new User(null,
		 * request.getParameter("username"), request.getParameter("password"),
		 * request.getParameter("email"), request.getParameter("address")))==1){ return
		 * "success"; }else { return "fail"; }
		 * 
		 * }
		 */
	
	 @RequestMapping(value = "doindex")
	 public String doIndex(HttpServletRequest request,Model model) {
		 	List<Car> allCar = carService.getAllCar();
		 
		 	if (!allCar.isEmpty()) {
				model.addAttribute("carList", allCar);
		 		return "user/list";
			}
		 	return "user/userLogin";
	 }
	 
	 
	
	 
	 
	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String checkLogin(HttpServletRequest request,HttpSession session,Model model) {
		User user = userService.Logincheck(request.getParameter("username"), request.getParameter("password"));
		if (user!=null) {
			model.addAttribute("user", user);
			session.setAttribute("user", user);
			return "user/index";
		}else {
			model.addAttribute("msg", "パスワードが間違っている、もう一度入力してください");
			return "user/userLogin";
		}
	}
	
	@RequestMapping(value = "/userinfo",method = RequestMethod.GET)
	public String showUser(HttpSession session) {
		User user=(User)session.getAttribute("user");
		if (user!=null) {
			return "user/userdetails";
		}else {
			return "user/index";
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
