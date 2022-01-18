package com.gogocar.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gogocar.bean.Admin;
import com.gogocar.bean.User;



@Service
public interface AdminService {

	Admin Logincheck(String username,String password);
	
	List<User> getAllUser();
	
	List<User> getSearchedUser(String searchName);
}
