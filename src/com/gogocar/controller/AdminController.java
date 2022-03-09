package com.gogocar.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.gogocar.bean.Admin;
import com.gogocar.bean.Car;
import com.gogocar.bean.Carorder;
import com.gogocar.bean.User;
import com.gogocar.service.AdminService;
import com.gogocar.service.CarService;
import com.gogocar.service.OrderService;
import com.gogocar.service.UserService;
import com.gogocar.utils.ConvertDateToString;




@RequestMapping("/admin")
@Controller
public class AdminController {

	@Autowired
	AdminService adminService;

	@Autowired
	CarService carService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	UserService userService;

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
	
	@RequestMapping(value = "/deleteuser",method = RequestMethod.GET)
	public String deleteUser(HttpServletRequest request,Model model) {
		
		Integer uid = Integer.parseInt(request.getParameter("uid"));
		Integer result = userService.deleteUserByUID(uid);
		
		if (result>0) {
			model.addAttribute("isdeleted", true);
			return "forward:showusers";
		}else {
			model.addAttribute("isdeleted", false);
			return "forward:showusers";
		}
		
	}
	
	

	@RequestMapping(value = "/showcars",method = RequestMethod.GET)
	public String showCars(Model model) {
		List<Car> carList = carService.getAllCar();
		if(!carList.isEmpty()) {
			model.addAttribute("carList", carList);
			return "admin/car";
		}else {
			return "admin/car";
		}
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
	
	@RequestMapping(value="/searchcarsbyBrand",method=RequestMethod.GET)
	public String searchCarsByBrand(HttpServletRequest request, Model model) {
		List<Car> brandCars = carService.getSearchedCarBrands(request.getParameter("brandname"));
		System.out.println(brandCars);
		System.out.println(request.getParameter("brandname"));
		if (!brandCars.isEmpty()) {
			model.addAttribute("carList",brandCars);
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
	
	@RequestMapping(value = "/updateCarPrice",method = RequestMethod.POST)
	 public String updateCarPrice(HttpServletRequest request) {
		
		String price =request.getParameter("price");
		String carstatus=request.getParameter("carstatus");
		Integer carid =Integer.parseInt(request.getParameter("carid"));
		Car car =carService.getCarById(carid);
		Integer result = carService.updateCarPrice(price,carstatus,car);
		return "redirect:showcars";	
		
	}
	
	
	@RequestMapping(value = "/deleteCar",method = RequestMethod.GET)
	public String deleteCar(Integer carid,Model model) {
		
		
		Integer result = carService.deleteCarById(carid);
		
		if (result>0) {
			model.addAttribute("isdeleted", true);
			return "forward:showcars";
		}else {
			model.addAttribute("isdeleted", false);
			return "forward:showcars";
		}
		
		
	}
	
	@RequestMapping(value = "/showorders")
	public String showOrders(Model model) {
		List<Carorder> orderList = orderService.getAllOrders();
		
		if (!orderList.isEmpty()) {
			model.addAttribute("orderList", orderList);
			return "admin/order";
		}else {
			return "admin/order";
		}
		
	}
	
	
	@RequestMapping(value = "/deleteOrder",method = RequestMethod.GET)
	public String deleteOrder(Integer orderid,Model model) {
		
		Integer isdeleted = orderService.deleteOrderById(orderid);
		if (isdeleted!=-1) {
			model.addAttribute("isdeleted", true);
			return "forward:showorders";
		}else {
			
			model.addAttribute("deletedfault", true);
			return "forward:showorders";
		}
		
	}
	
	@RequestMapping(value = "/approveOrder",method = RequestMethod.GET)
	public String approveOrder(Integer orderid,Model model) {
	
		Integer isApproved = orderService.approveOrder(orderid);
		if (isApproved!=-1) {
			model.addAttribute("isApproved",true);
			return "forward:showorders";
		}else {
			model.addAttribute("updatefalut",true);
			return "forward:showorders";
			
		}
	}
	
	
	@RequestMapping(value = "/backCar",method = RequestMethod.GET)
	public String backCar(Integer orderid,Integer carid,Model model) {
		Integer isbacked = orderService.backOrder(orderid);
		Car car = carService.getCarById(carid);
		carService.updateCarOrderEnable(car);
		if (isbacked!=-1) {
			model.addAttribute("isbacked",true);
			return "forward:showorders";
		}else {
			model.addAttribute("backfalut", true);
			return "forward:showorders";
			
		}
		
	}
	
	@RequestMapping(value = "/draw")
	public void draw(HttpServletResponse response) throws IOException {
		
		
		Map<String, Long> map = new HashMap<String, Long>();
		List<Map<String, Object>> UordersList = orderService.selectCountOrder();
		for(Map UoderMap:UordersList) {
			 Integer uid =(Integer)UoderMap.get("user_id");
			 User user = userService.getUserByUID(uid);
			 Long orderCount=(Long)UoderMap.get("order_count");
			 map.put(user.getUsername(), orderCount);
		}
		System.out.println(map);
		
		/*
		 * map.put("user1", 5); map.put("user2", 7); map.put("user3", 3);
		 * map.put("user4", 1);
		 */

		String mapstr = new ObjectMapper().writeValueAsString(map);
		response.getWriter().print(mapstr);
	
	}
	
	@RequestMapping(value = "/drawbrand")
	public void drawBrand(HttpServletResponse response) throws IOException {
		Map<String, Long> map2 = new HashMap<String, Long>();
		List<Map<String, Object>> brandList = orderService.selectBrandCount();
		
		for(Map brandmap:brandList) {
			Long brandCount=(Long)brandmap.get("brand_count");
			map2.put((String)brandmap.get("brandname"),brandCount);
		}
		System.out.println(map2);
		
		String mapstr1 = new ObjectMapper().writeValueAsString(map2);
		response.getWriter().print(mapstr1);
	}
	
	

}
