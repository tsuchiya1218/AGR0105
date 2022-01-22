package com.gogocar.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gogocar.bean.Admin;
import com.gogocar.bean.Car;
import com.gogocar.dao.AdminMapper;
import com.gogocar.dao.CarMapper;
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
	CarMapper carMapper;


	@Test
	public void testCRUD() {

		String str = ConvertDateToString.NowDateToStr();
		System.out.println(str);
	}
}
