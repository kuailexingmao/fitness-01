package org.zyj.service;

import org.zyj.utils.DataGrid;
import org.zyj.vo.User;

/**
 * Created by zyj on 2017/10/16.
 */
public interface UserService {

    DataGrid<User> getListUser(Integer page, Integer rows);

    void deleteUser(Integer uid);
}
