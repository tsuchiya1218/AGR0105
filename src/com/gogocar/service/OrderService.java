package com.gogocar.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gogocar.bean.Carorder;

@Service
public interface OrderService {

	List<Carorder> getAllOrders();
	
	List<Carorder> getSearchedOrders(String searchName);
	
	Carorder getOrderById(Integer id);
	
	
	
	Integer createOrder(Carorder order);

}
