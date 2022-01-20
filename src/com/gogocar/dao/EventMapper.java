package com.gogocar.dao;

import com.gogocar.bean.Event;
import java.util.List;

public interface EventMapper {
    int deleteByPrimaryKey(Integer eventId);

    int insert(Event record);

    Event selectByPrimaryKey(Integer eventId);

    List<Event> selectAll();

    int updateByPrimaryKey(Event record);
}