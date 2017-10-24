package org.zyj.dao;

import org.zyj.vo.User;

public interface VipMapper {

	User findById(String certifyno);

	void addvip(User user);

}
