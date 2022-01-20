package com.gogocar.dao;

import java.util.List;

import com.gogocar.bean.Car;

public interface CarMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Car record);

    Car selectByPrimaryKey(Integer id);

    List<Car> selectAll();
    
    List<Car> selectCarsByName(String carName);
    
    int updateByPrimaryKey(Car record);
}