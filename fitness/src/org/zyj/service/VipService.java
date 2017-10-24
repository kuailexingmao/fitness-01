package org.zyj.service;

import org.zyj.vo.User;

public interface VipService {
	public User findById(String idNo);

	public void addvip(User user);
          
}
