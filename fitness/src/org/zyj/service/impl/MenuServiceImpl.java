package org.zyj.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.zyj.dao.MenuMapper;
import org.zyj.service.MenuService;
import org.zyj.vo.Menu;

@Service
public class MenuServiceImpl implements MenuService {

	@Resource
	private MenuMapper menuMapperDao;
	public List<Menu> getShowMenu(String isboss) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isshow", isboss);
		List<Menu> menu = menuMapperDao.getShowMenu(map);
		return menu;
	}

}
