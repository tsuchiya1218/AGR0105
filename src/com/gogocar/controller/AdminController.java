package com.gogocar.controller;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gogocar.bean.Admin;
import com.gogocar.bean.Car;
import com.gogocar.bean.User;
import com.gogocar.service.AdminService;
import com.gogocar.service.CarService;
import com.gogocar.utils.ConvertDateToString;




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
	
	@RequestMapping(value = "/logout",method = RequestMethod.GET)
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "admin/index";
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
		List<Car> searchedCars = carService.getSearchedCars(request.getParameter("search"));
		if (!searchedCars.isEmpty()) {
			model.addAttribute("carList",searchedCars);
			return "admin/car";
		}else {
			model.addAttribute("noneSearched",true);
			return "admin/car";
		}
		
		
	}
	
	@RequestMapping(value = "/addcar",method = RequestMethod.POST)
	public String addCar(HttpServletRequest request,MultipartFile image) throws Exception {
		String name = UUID.randomUUID().toString().replaceAll("-","");
		String ext = FilenameUtils.getExtension(image.getOriginalFilename());
		String url=request.getServletContext().getRealPath("/upload");
		
		System.out.println(url+"/"+name+"."+ext);
		image.transferTo(new File(url+"/"+name+"."+ext));
		carService.addCar(new Car(null, request.getParameter("carno"), request.getParameter("brandname"), "upload/"+name+"."+ext, request.getParameter("color"), ConvertDateToString.NowDateToStr(), "レンタル可能", request.getParameter("price"), request.getParameter("info")));
		
		
		return "redirect:showcars";
	}
	
	
	@RequestMapping(value = "/deleteCar",method = RequestMethod.GET)
	public String deleteCar(Integer carid,Model model) {
		model.addAttribute("isdeleted", true);
		carService.deleteCarById(carid);
		return "forward:showcars";
	}
	

}
