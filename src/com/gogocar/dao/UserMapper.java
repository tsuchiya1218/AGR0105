package com.gogocar.dao;

import com.gogocar.bean.User;
import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    User selectByPrimaryKey(Integer id);
    
    User selectByUserName(String username);
    
    List<User> selectAll();
    
    List<User> selectUsersByUserName(String username);

    int updateByPrimaryKey(User record);
}