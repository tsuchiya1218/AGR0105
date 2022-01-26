package com.gogocar.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gogocar.bean.Carorder;
import com.gogocar.dao.CarMapper;
import com.gogocar.dao.OrderMapper;
import com.gogocar.service.OrderService;
@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	OrderMapper orderMapper;
	
	@Override
	public List<Carorder> getAllOrders() {
		List<Carorder> emptyList = new ArrayList<Carorder>();
		List<Carorder> orderList = orderMapper.selectAll();
		if (!orderList.isEmpty()) {
			return orderList;
		}else {
			return emptyList;
		}
		
	}

	@Override
	public List<Carorder> getSearchedOrders(String searchName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Carorder getOrderById(Integer id) {
		if (orderMapper.selectByPrimaryKey(id)!=null) {
			return orderMapper.selectByPrimaryKey(id);
		}
		return null;
	}

	@Override
	public Integer createOrder(Carorder order) {
		// TODO Auto-generated method stub
		if (orderMapper.selectByCarId(order.getCarId())==null) {
			return orderMapper.insert(order);
		}
		return -1;
	}


}
