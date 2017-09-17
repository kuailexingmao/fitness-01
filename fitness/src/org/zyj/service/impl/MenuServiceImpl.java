package org.zyj.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.zyj.dao.MenuMapper;
import org.zyj.service.MenuService;
import org.zyj.vo.Menu;

@Service
public class MenuServiceImpl implements MenuService {

	@Resource
	private MenuMapper menuMapperDao;
	public List<Menu> getShowMenu() {
		// TODO Auto-generated method stub
		List<Menu> menu = menuMapperDao.getShowMenu();
		return menu;
	}

}
