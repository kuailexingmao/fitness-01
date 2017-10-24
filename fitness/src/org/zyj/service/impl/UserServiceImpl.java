package org.zyj.service.impl;

import org.springframework.stereotype.Service;
import org.zyj.dao.UserMapper;
import org.zyj.service.UserService;
import org.zyj.utils.DataGrid;
import org.zyj.vo.User;

import javax.annotation.Resource;

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
    public void deleteUser(Integer uid) {
        userMapperDao.deleteByPrimaryKey(uid);
    }
}
