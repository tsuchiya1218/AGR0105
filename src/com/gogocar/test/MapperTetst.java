package com.gogocar.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

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
import com.gogocar.service.CarService;
import com.gogocar.service.UserService;
import com.gogocar.utils.ConvertDateToString;
import com.gogocar.utils.mailUtils;


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
	
	@Autowired
	UserService UserService;
	
	@Autowired
	CarService carService;


	@Test
	public void testCRUD() {
		try {
			mailUtils.sendFromYandex("gogo.car@yandex.com", "zxttircckhhnaqvl", "20jy0122@jec.ac.jp,20jy0113@jec.ac.jp", "Project Test for 2 User", "its test for prj send to 2 users");
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void  strUtils(){
		
		String str = ConvertDateToString.dateConvertion("1999/2/2");
		System.out.println(str);
	}
	
	@Test
	public void  carTest(){
		/*
		 * List<Map<String, Object>> userId = orderMapper.selectcountByUserId();
		 * System.out.println(userId);
		 */
		/*
		 * List<Map<String, Object>> list = orderMapper.selectByUserId(1);
		 * System.out.println(list.isEmpty());
		 */
		/*
		 * List<Map<String, Object>> list = orderMapper.selectByCarId(46);
		 * System.out.println(list);
		 */
/*		Integer deleteUserByUID = UserService.deleteUserByUID(2);
		System.out.println(deleteUserByUID);*/
		
		
		/*
		 * List<Map<String, Object>> list = orderMapper.selectorderdate(45);
		 * System.out.println(list); ArrayList<String> truelist = new
		 * ArrayList<String>(); for(Map map:list) { String starttime =(String)
		 * map.get("start_time"); String endtime =(String) map.get("end_time");
		 * List<String> list1 = ConvertDateToString.getBetweenDate(starttime,endtime);
		 * truelist.addAll(list1);
		 * 
		 * } System.out.println(truelist);
		 */
		
		/*
		 * List<Map<String, Object>> userlist = orderMapper.selectcountByUserId();
		 * System.out.println(userlist); List<Map<String, Object>> list =
		 * orderMapper.selectcountByCarBrand(); System.out.println(list);
		 */
			/*
			 * List<String> betweenDate = ConvertDateToString.getBetweenDate("2022-03-09",
			 * "2022-03-15"); System.out.println(betweenDate);
			 */
	
		 List<Car> selectByCarBrand = carMapper.selectByCarBrand("??????????????????");
		System.out.println(selectByCarBrand);
		
	}
}
