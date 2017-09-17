package org.zyj.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zyj.dao.EmpMapper;
import org.zyj.dao.UserMapper;
import org.zyj.service.LoginService;
import org.zyj.vo.Emp;
import org.zyj.vo.User;

import com.mysql.jdbc.StringUtils;

@Service
public class LoginServiceImpl implements LoginService {

	@Resource
	private EmpMapper empMapperDao;
	
	public Emp checkEmp(Emp emp) {
		Emp checkEmp = empMapperDao.checkEmp(emp);
		return checkEmp;
	}

}
