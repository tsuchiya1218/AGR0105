package com.gogocar.serviceImpl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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

	@Override
	public Integer deleteOrderById(Integer orderid) {
		// TODO Auto-generated method stub
		Carorder carorder = orderMapper.selectByPrimaryKey(orderid);
		if (carorder!=null&&carorder.getOrderStatus().equals("レンタル完了")) {
			return orderMapper.deleteByPrimaryKey(orderid);
		}
		
		return -1;
	}

	@Override
	public List<Map<String, Object>> getOrdersByUserId(Integer userid) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> UserOrders = orderMapper.selectByUserId(userid);
		if (UserOrders!=null) {
			return UserOrders;
		}else {
			return new ArrayList<Map<String,Object>>();
		}
		
	}

	@Override
	public Integer approveOrder(Integer orderid) {
		Carorder order = orderMapper.selectByPrimaryKey(orderid);
		if (order!=null) {
			order.setOrderStatus("レンタル中");
			return orderMapper.updateByPrimaryKey(order);
		}
		return -1;
	}


}
