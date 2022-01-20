package com.gogocar.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gogocar.bean.Car;
import com.gogocar.dao.CarMapper;
import com.gogocar.service.CarService;

@Service
public class CarServiceImpl implements CarService{

	@Autowired
	CarMapper carMapper;

	@Override
	public List<Car> getAllCar() {
		List<Car> carList = carMapper.selectAll();
		if (!carList.isEmpty()){
				return carList;
		}
		return null;
	}

	@Override
	public List<Car> getSearchedCars(String searchName) {
		List<Car> searchedCarList = carMapper.selectCarsByName(searchName);
		List<Car> emptyList = new ArrayList<Car>();
		
		if (!searchedCarList.isEmpty()) {
				return searchedCarList;
		}
		return emptyList;
	}
	
	
	
}
