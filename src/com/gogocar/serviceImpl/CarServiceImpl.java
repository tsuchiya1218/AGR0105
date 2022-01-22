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

	@Override
	public Integer addCar(Car car) {
		// TODO Auto-generated method stub
		if (carMapper.selectByCarName(car.getCarno())==null) {
			return carMapper.insert(car);
		}
		return -1;
		
	}

	@Override
	public Integer deleteCarById(Integer carid) {
		// TODO Auto-generated method stub
		if (carMapper.selectByPrimaryKey(carid)!=null) {
			return carMapper.deleteByPrimaryKey(carid);
		}
		
		return -1;
	}
	
	
	
}
