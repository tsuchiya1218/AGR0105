package com.gogocar.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gogocar.bean.User;
import com.gogocar.dao.UserMapper;
import com.gogocar.service.UserService;


@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserMapper userMapper;
	
	public User Logincheck(String username, String password) {
		
		User user = userMapper.selectByUserName(username);
		if (user!=null&&user.getPassword().equals(password)) {
			return user;
		}
		return null;
	}

	public Integer regist(User user) {
		// TODO Auto-generated method stub
		User isUser = userMapper.selectByUserName(user.getUsername());
		if (isUser==null) {
			return userMapper.insert(user);
		}
		return -1;
	}

	public User getUserByUID(Integer id) {
		User user = userMapper.selectByPrimaryKey(id);
		if (user!=null) {
			return user;
		}else {
			return null;
		}	
		
	}

}
