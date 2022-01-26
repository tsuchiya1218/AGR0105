package com.gogocar.dao;

import com.gogocar.bean.Carorder;
import java.util.List;

public interface OrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Carorder record);

    Carorder selectByPrimaryKey(Integer id);
    
    Carorder selectByCarId(Integer carid);

    List<Carorder> selectAll();

    int updateByPrimaryKey(Carorder record);
}