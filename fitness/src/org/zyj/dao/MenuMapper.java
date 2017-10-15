package org.zyj.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.zyj.vo.Menu;

public interface MenuMapper {
    int deleteByPrimaryKey(Integer mid);

    int insert(Menu record);

    Menu selectByPrimaryKey(Integer mid);

    int updateByPrimaryKey(Menu record);

	List<Menu> getShowMenu(Map<String, Object> map);
}