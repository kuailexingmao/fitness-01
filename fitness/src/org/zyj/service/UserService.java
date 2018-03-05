package org.zyj.service;

import org.zyj.utils.DataGrid;
import org.zyj.vo.User;

import javax.servlet.ServletOutputStream;
import java.io.InputStream;
import java.util.List;

/**
 * Created by zyj on 2017/10/16.
 */
public interface UserService {

    DataGrid<User> getListUser(Integer page, Integer rows);

    void deleteUser(String certifyno);

	User findUserByUid(Integer uid);

	void updateUser(User user);

	void addUser(User user);

	void exportExcel(List<User> userList, ServletOutputStream out);

	void importExcel(InputStream file, String excelFileName);

	List<User> find();
}
