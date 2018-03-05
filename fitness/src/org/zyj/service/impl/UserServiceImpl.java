package org.zyj.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zyj.dao.TcuMapper;
import org.zyj.dao.UserMapper;
import org.zyj.service.UserService;
import org.zyj.utils.DataGrid;
import org.zyj.utils.ExcelUtils;
import org.zyj.vo.User;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by zyj on 2017/10/16.
 */
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapperDao;
    
    @Resource
    private TcuMapper tcuMapperDao;
    
    @Override
    public DataGrid<User> getListUser(Integer page, Integer rows) {
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("start",(page-1)*rows);
        map.put("size",rows);
        List<User> listUser = userMapperDao.getListClazz(map);
        Integer count =  userMapperDao.getCount();
        DataGrid<User> dataUser = new DataGrid<User>();
        dataUser.setRows(listUser);
        dataUser.setTotal(count);
        return dataUser;
    }

    @Override
    public void deleteUser(String certifyno) {
    	int byCertifyno = tcuMapperDao.deleteByCertifyno(certifyno);
    	if (byCertifyno >= 0) {
    		userMapperDao.deleteByCertifyno(certifyno);
    	}else{
    		throw new RuntimeException();
    	}
    }

	@Override
	public User findUserByUid(Integer uid) {
		User user = userMapperDao.selectByPrimaryKey(uid);
		return user;
	}

	@Override
	public void updateUser(User user) {
		userMapperDao.updateByPrimaryKey(user);
	}

	@Override
	@Transactional(rollbackFor = Throwable.class)
	public void addUser(User user) {
		userMapperDao.insert(user);
	}

	@Override
	public void exportExcel(List<User> userList, ServletOutputStream out) {
		ExcelUtils.exportUserExcel(userList, out);
	}

	@Override
	public void importExcel(InputStream file, String excelFileName) {
		List<User> listuser = ExcelUtils.importExcel(file, excelFileName);
		for (User user : listuser) {
			this.addUser(user);
		}
	}

	@Override
	public List<User> find() {
		List<User> userList = userMapperDao.find();
		return userList;
	}

}
