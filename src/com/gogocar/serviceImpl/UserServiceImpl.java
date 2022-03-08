package com.gogocar.serviceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gogocar.bean.User;
import com.gogocar.dao.OrderMapper;
import com.gogocar.dao.UserMapper;
import com.gogocar.service.UserService;


@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	OrderMapper orderMapper;
	
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
	
	public Integer changePWD(User user) {
		User isUser = userMapper.selectByUserName(user.getUsername());
		if (isUser!=null) {
			return userMapper.updateByPrimaryKey(user);
		}
		return -1;
	}
	
	
	public Integer changeInfo(User user) {
		User isUser = userMapper.selectByUserName(user.getUsername());
		if (isUser!=null) {
			return userMapper.updateByPrimaryKey(user);
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

	@Override
	public Integer deleteUserByUID(Integer id) {
		// TODO Auto-generated method stub
		User user = userMapper.selectByPrimaryKey(id);
		List<Map<String, Object>> orderList = orderMapper.selectByUserId(id);
		if (user!=null) {
			if (orderList.isEmpty()) {
				return userMapper.deleteByPrimaryKey(id);
			}else {
				for(Map<String, Object> map:orderList) {
					String orderStatus  = (String)map.get("order_status");
					if (!orderStatus.equals("レンタル完了")) {
						return -1;
					}
				}
				return userMapper.deleteByPrimaryKey(id);
			}
			
		}
		return -1;
	}

	

}
