package com.gogocar.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gogocar.bean.Car;
import com.gogocar.service.CarService;


@RequestMapping("/car")
@Controller
public class CarController {

	@Autowired
	CarService carService;
	
	
	@RequestMapping(value = "cardetail",method = RequestMethod.GET)
	public String carDetail(Integer carid,Model model) {
		
		Car car = carService.getCarById(carid);
		if (car!=null) {
			model.addAttribute("car",car);
			return "user/cardetails";
			
		}
		return "redirect:user/doindex";
	}
	
	
	
}
