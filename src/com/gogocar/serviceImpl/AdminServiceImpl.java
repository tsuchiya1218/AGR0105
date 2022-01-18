package com.gogocar.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gogocar.bean.Admin;
import com.gogocar.bean.User;
import com.gogocar.dao.AdminMapper;
import com.gogocar.dao.UserMapper;
import com.gogocar.service.AdminService;



@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminMapper adminMapper;
	
	@Autowired
	UserMapper userMapper;

	public Admin Logincheck(String username, String password) {
		// TODO Auto-generated method stub
		Admin admin = adminMapper.selectByUsername(username);
		if (admin!=null&&admin.getPassword().equals(password)) {
			return admin;
		}
		
		return null;
	}

	public List<User> getAllUser() {
		
		List<User> userList = userMapper.selectAll();
		// TODO Auto-generated method stub
		if (!userList.isEmpty()) {
			return userList;
		}
		
		return null;
	}

	@Override
	public List<User> getSearchedUser(String searchName) {
		// TODO Auto-generated method stub
		List<User> searchedList = userMapper.selectUsersByUserName(searchName);
		if (!searchedList.isEmpty()) {
			return searchedList;
		}else {
			List<User> emptyList = new ArrayList<User>();
			return emptyList;
		}
		
		
	}

}
