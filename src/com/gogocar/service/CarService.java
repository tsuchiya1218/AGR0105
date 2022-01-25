package com.gogocar.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gogocar.bean.Car;

@Service
public interface CarService {

	List<Car> getAllCar();
	
	List<Car>	getSearchedCars(String searchName);
	
	Car getCarById(Integer carid);
	
	Integer addCar(Car car);
	
	Integer deleteCarById(Integer carid);
}
