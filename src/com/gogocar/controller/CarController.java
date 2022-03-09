package com.gogocar.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gogocar.bean.Car;
import com.gogocar.bean.Carorder;
import com.gogocar.service.CarService;
import com.gogocar.service.OrderService;
import com.gogocar.utils.ConvertDateToString;


@RequestMapping("/car")
@Controller
public class CarController {

	@Autowired
	CarService carService;
	
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value = "cardetail",method = RequestMethod.GET)
	public String carDetail(Integer carid,Model model) {
		
		Car car = carService.getCarById(carid);
		if (car!=null) {
			model.addAttribute("car",car);
			return "user/cardetails";
			
		}
		return "redirect:/user/doindex";
	}
	
	@RequestMapping(value = "checkout",method = RequestMethod.POST)
	public String checkOut(HttpServletRequest request,HttpSession session) {
		
		String carid = request.getParameter("carinfo");
		Car car = carService.getCarById(Integer.parseInt(carid));
		
		String dateStr =request.getParameter("date");
		String[] date = dateStr.split(" - ");

		Long diff = ConvertDateToString.dayDiff(date[1], date[0]);		
		Long price = Integer.parseInt(car.getPrice())*diff;
	
		Carorder order = new Carorder(null, Integer.parseInt(request.getParameter("userinfo")), car.getId(),price.toString(), date[0], date[1], "レンタル審査");		
		orderService.createOrder(order);
		//carService.updateCarOrderDisable(car);
		
		return "user/thanks";
	}
	
	
	
}
