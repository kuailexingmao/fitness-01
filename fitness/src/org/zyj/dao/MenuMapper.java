package org.zyj.dao;

import java.util.List;

import org.zyj.vo.Menu;

public interface MenuMapper {
    int deleteByPrimaryKey(Integer mid);

    int insert(Menu record);

    Menu selectByPrimaryKey(Integer mid);

    int updateByPrimaryKey(Menu record);

	List<Menu> getShowMenu();
}