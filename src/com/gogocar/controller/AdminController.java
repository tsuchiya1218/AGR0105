package com.gogocar.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gogocar.bean.Admin;
import com.gogocar.bean.Car;
import com.gogocar.bean.User;
import com.gogocar.service.AdminService;
import com.gogocar.service.CarService;


@RequestMapping("/admin")
@Controller
public class AdminController {

	@Autowired
	AdminService adminService;

	@Autowired
	CarService carService;

	@RequestMapping(value = "/login",method = RequestMethod.POST)
	public String adminLogin(HttpServletRequest request,HttpSession session,Model model) {
		Admin admin = adminService.Logincheck(request.getParameter("username"), request.getParameter("password"));
		if (admin!=null) {
			System.out.println("");
			session.setAttribute("admin", admin);
			return "admin/index";
		}else {
			model.addAttribute("msg", "パスワードが間違っている、もう一度入力してください");
			return "admin/login";
		}
	}


	@RequestMapping(value = "/showusers",method = RequestMethod.GET)
	public String showUsers(Model model) {
		List<User> userList = adminService.getAllUser();
		if(!userList.isEmpty()) {
			model.addAttribute("userList", userList);
			return "admin/user";
		}
		return "admin/user";
	}

	@RequestMapping(value = "/searchusers",method = RequestMethod.GET)
	public String searchUsers(HttpServletRequest request,Model model) {

		/*	System.out.println(request.getParameter("search"));*/
		List<User> searchedList = adminService.getSearchedUser(request.getParameter("search"));

		if (searchedList.isEmpty()) {
			return "admin/user";
		}else {
			model.addAttribute("userList",searchedList );
			return "admin/user";
		}
	}

	@RequestMapping(value = "/showcars",method = RequestMethod.GET)
	public String showCars(Model model) {
		List<Car> carList = carService.getAllCar();
		if(!carList.isEmpty()) {
			model.addAttribute("carList", carList);
			return "admin/car";
		}
		return "admin/index";
	}

	@RequestMapping(value="/searchcars",method=RequestMethod.GET)
	public String searchCars(HttpServletRequest request, Model model) {
		String datestr = request.getParameter("date");
		String[] split = datestr.split(" . ");
		System.out.println("開始時間："+split[0]);
		System.out.println("終了時間："+split[1]);

		return "admin/car";
	}

}
