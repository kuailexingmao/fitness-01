package org.zyj.dao;

import org.zyj.vo.User;

import java.util.List;
import java.util.Map;

public interface UserMapper {
    int deleteByPrimaryKey(Integer uid);

    int insert(User record);

    User selectByPrimaryKey(Integer uid);

    int updateByPrimaryKey(User record);

    List<User> getListClazz(Map<String, Object> map);

    Integer getCount();

	void deleteByCertifyno(String certifyno);
}