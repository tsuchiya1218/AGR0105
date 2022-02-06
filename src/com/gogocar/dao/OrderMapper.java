package com.gogocar.dao;

import com.gogocar.bean.Carorder;
import java.util.List;
import java.util.Map;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Carorder record);

    Carorder selectByPrimaryKey(Integer id);
    
    Carorder selectByCarId(Integer carid);

    List<Carorder> selectAll();

    int updateByPrimaryKey(Carorder record);
    
    List<Map<String, Object>> selectByUserId(Integer userid);
    List<Map<String, Object>> selectcountByUserId();
}