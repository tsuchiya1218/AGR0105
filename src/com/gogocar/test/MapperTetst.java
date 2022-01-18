package com.gogocar.test;

import java.util.List;

import org.apache.catalina.core.ApplicationContext;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.gogocar.bean.User;
import com.gogocar.dao.UserMapper;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTetst {
	
	@Autowired
	UserMapper userMapper;
	
	@Test
	public void testCRUD() {
		
		List<User> user = userMapper.selectUsersByUserName("ni");
		user.forEach(System.out::println);
	
	}
}
