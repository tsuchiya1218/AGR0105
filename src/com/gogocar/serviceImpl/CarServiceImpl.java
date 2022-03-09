package com.gogocar.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gogocar.bean.Car;
import com.gogocar.dao.CarMapper;
import com.gogocar.dao.OrderMapper;
import com.gogocar.service.CarService;

@Service
public class CarServiceImpl implements CarService{

	@Autowired
	CarMapper carMapper;
	
	@Autowired
	OrderMapper orderMapper;

	@Override
	public List<Car> getAllCar() {
		List<Car> emptyList = new ArrayList<Car>();
		List<Car> carList = carMapper.selectAll();
		if (!carList.isEmpty()){
				return carList;
		}
		return emptyList;
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
	public List<Car> getSearchedCarBrands(String brandName) {
		List<Car> searchedCarBrandList = carMapper.selectByCarBrand(brandName);
		List<Car> emptyBrandList = new ArrayList<Car>();
		
		if (!searchedCarBrandList.isEmpty()) {
				return searchedCarBrandList;
		}
		return emptyBrandList;
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
		
		Car car = carMapper.selectByPrimaryKey(carid);
		// TODO Auto-generated method stub
		if (car!=null&&car.getStatus().equals("レンタル可能")) {
		
			return carMapper.deleteByPrimaryKey(carid);

		}
		
		return -1;
	}

	@Override
	public Car getCarById(Integer carid) {
		if (carMapper.selectByPrimaryKey(carid)!=null) {
			return carMapper.selectByPrimaryKey(carid);
		}
		return null;
	}

	@Override
	public Integer updateCarOrderDisable(Car car) {
		
		if (carMapper.selectByCarName(car.getCarno())!=null) {
			car.setStatus("レンタル不可");
			return carMapper.updateByPrimaryKey(car);
		}
		return -1;
	}
	
	@Override
	public Integer updateCarOrderEnable(Car car) {
		
		if (carMapper.selectByCarName(car.getCarno())!=null) {
			car.setStatus("レンタル可能");
			return carMapper.updateByPrimaryKey(car);
		}
		return -1;
	}

	@Override
	public Integer updateCarPrice(String price,String carstatus,Car car) {
		if(carMapper.selectByPrimaryKey(car.getId())!=null) {
			car.setPrice(price);
			car.setStatus(carstatus);
			return carMapper.updateByPrimaryKey(car);		
			}
		
		return -1;
	}

	
	
	
	
}
