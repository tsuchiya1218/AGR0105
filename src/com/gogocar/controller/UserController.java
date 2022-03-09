package com.gogocar.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gogocar.bean.Car;
import com.gogocar.bean.User;
import com.gogocar.service.CarService;
import com.gogocar.service.OrderService;
import com.gogocar.service.UserService;
import com.gogocar.utils.ConvertDateToString;

@RequestMapping("/user")
@Controller
public class UserController {
	 
	 @Autowired
	 UserService userService;
	 
	 @Autowired
	 CarService carService;
	 
	 @Autowired
	 OrderService orderService;
	 
		/*
		 * @RequestMapping(value = "/regist",method = RequestMethod.POST ) public String
		 * regist(HttpServletRequest request) { if (userService.regist(new User(null,
		 * request.getParameter("username"), request.getParameter("password"),
		 * request.getParameter("email"), request.getParameter("address")))==1){ return
		 * "success"; }else { return "fail"; }
		 * 
		 * }
		 */
	 
	 @RequestMapping(value = "/regist",method=RequestMethod.POST)
	 public String regist(HttpServletRequest request,Model model) {
		 User user = new User(null, (String)request.getParameter("username"),(String) request.getParameter("password"), (String)request.getParameter("driverlicense"), (String)request.getParameter("birthDate"), (String)request.getParameter("phoneNumber"),(String) request.getParameter("email"), (String)request.getParameter("address"), ConvertDateToString.NowDateToStr(), 0, (String)request.getParameter("emeg"), (String)request.getParameter("emegtel"),(String)request.getParameter("licenseexpiredate"));
		 if(userService.regist(user)==1) {
			 System.out.println(user);
			 model.addAttribute("isregisted", true);
			 return "user/userLogin";
		 }else {
			 model.addAttribute("isregisted", false);
			 return "user/register";
		 }
	 }
	 
	 
	 
	
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
			return "user/index";
		}
		return "user/userLogin";
	}
	
	@RequestMapping(value = "/changePWD",method = RequestMethod.GET)
	public String changePWD(HttpSession session,HttpServletRequest request,Model model) {
		User user = (User)session.getAttribute("user");
		String oldpassword = request.getParameter("oldpassword");
		String password = request.getParameter("password");
	
		if (!user.getPassword().equals(oldpassword)) {
			System.out.println("passwordfailed");
			model.addAttribute("ischanged", false);
			return "user/changePWD";
		}else {
			model.addAttribute("ischanged", true);
			user.setPassword(password);
			userService.changePWD(user);
			session.invalidate();
			System.out.println("password changed");
			return "user/userLogin";
		}
		
	}
	
	@RequestMapping(value = "/changeInfo",method = RequestMethod.GET)
	public String changeInfo(HttpSession session,HttpServletRequest request,Model model) {
		User user = (User)session.getAttribute("user");
		String username = request.getParameter("username");
		if (user.getUsername().equals(username)) {
			/* user.setDrivelicense((String)request.getParameter("driverlicense")); */
			user.setExpiredate((String)request.getParameter("licenseexpiredate"));
			user.setEmail((String)request.getParameter("email"));
			/* user.setBirthday((String)request.getParameter("birthDate")); */
			user.setTel((String)request.getParameter("phoneNumber"));
			user.setAddress((String)request.getParameter("address"));
			user.setEmegname((String)request.getParameter("emeg"));
			user.setEmegtel((String)request.getParameter("emegtel"));
			userService.changeInfo(user);
			model.addAttribute("isupdated", true);
			return "forward:userinfo";
		}
		model.addAttribute("isupdated", false);
		return "forward:userinfo";
	}
	
	
	@RequestMapping(value = "/orderhistory",method = RequestMethod.GET)
	public String orderHistory(Integer userid,Model model) {
		List<Map<String, Object>> userOrder = orderService.getOrdersByUserId(userid);
		if (!userOrder.isEmpty()) {
		
			model.addAttribute("userOrder", userOrder);
			
			return "user/orderdetails";
		}else {
			model.addAttribute("errMsg", "");
			return "user/orderdetails";
		}
		
	}
	
	@RequestMapping(value = "/setDate")
	public void setDate(HttpServletResponse response,Integer carid) throws IOException {
		
		
		/* Map<String, Long> map = new HashMap<String, Long>(); */
		/*
		 * List<Map<String, Object>> UordersList = orderService.selectCountOrder();
		 * for(Map UoderMap:UordersList) { Integer uid
		 * =(Integer)UoderMap.get("user_id"); User user = userService.getUserByUID(uid);
		 * Long orderCount=(Long)UoderMap.get("order_count");
		 * map.put(user.getUsername(), orderCount); } System.out.println(map);
		 */
		
		ArrayList<String> dateList = new ArrayList<String>();
		List<Map<String, Object>> selectorderdateList = orderService.selectorderdate(carid);
		for(Map map:selectorderdateList) {
			  String starttime =(String) map.get("start_time");
			  String endtime =(String) map.get("end_time");
			  List<String> list1 = ConvertDateToString.getBetweenDate(starttime,endtime);
			  dateList.addAll(list1);
		}
		/*
		 * dateList.add("2022-3-09"); dateList.add("2022-3-11");
		 * dateList.add("2022-3-12");
		 */
		 
		
		/*
		 * map.put("user1", 5); map.put("user2", 7); map.put("user3", 3);
		 * map.put("user4", 1);
		 */

		String mapstr = new ObjectMapper().writeValueAsString(dateList);
		response.getWriter().print(mapstr);
	
	}
	

	

	

}
