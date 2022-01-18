package com.gogocar.service;

import org.springframework.stereotype.Service;

import com.gogocar.bean.User;


@Service
public interface UserService {
	
	User Logincheck(String username,String password);
	
	Integer regist(User user);
	
	User getUserByUID(Integer id);
}
