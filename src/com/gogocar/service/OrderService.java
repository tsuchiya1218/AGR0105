package com.gogocar.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.gogocar.bean.Carorder;

@Service
public interface OrderService {

	List<Carorder> getAllOrders();
	
	List<Carorder> getSearchedOrders(String searchName);
	
	Carorder getOrderById(Integer id);
	
	List<Map<String, Object>> getOrdersByUserId(Integer userid);
	
	Integer deleteOrderById(Integer orderid);
	
	Integer createOrder(Carorder order);

}
