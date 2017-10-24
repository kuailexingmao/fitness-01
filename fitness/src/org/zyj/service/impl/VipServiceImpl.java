package org.zyj.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.zyj.dao.VipMapper;
import org.zyj.service.VipService;
import org.zyj.vo.User;

@Service
public class VipServiceImpl implements VipService {

	
	@Resource
    private VipMapper vipMapper;
	
	@Override
	public User findById(String idNo) {
		return vipMapper.findById(idNo);
	}

	@Override
	public void addvip(User user) {
		vipMapper.addvip(user);
		
	}
	
	

}
