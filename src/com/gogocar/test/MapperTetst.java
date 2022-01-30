package com.gogocar.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gogocar.bean.Admin;
import com.gogocar.bean.Car;
import com.gogocar.bean.Carorder;
import com.gogocar.dao.AdminMapper;
import com.gogocar.dao.CarMapper;
import com.gogocar.dao.OrderMapper;
import com.gogocar.dao.UserMapper;
import com.gogocar.utils.ConvertDateToString;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTetst {

	@Autowired
	UserMapper userMapper;

	@Autowired
	AdminMapper adminMapper;

	@Autowired
	OrderMapper orderMapper;
	

	@Autowired
	CarMapper carMapper;


	@Test
	public void testCRUD() {
		Carorder order = orderMapper.selectByPrimaryKey(3);
		System.out.println(order);
		order.setOrderStatus("レンタル審査");
		orderMapper.updateByPrimaryKey(order);
		Carorder order2 = orderMapper.selectByPrimaryKey(3);
		System.out.println(order2);
	
	}
}
