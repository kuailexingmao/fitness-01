package org.zyj.dao;

import org.zyj.vo.Clazz;

import java.util.List;
import java.util.Map;

public interface ClazzMapper {
    int deleteByPrimaryKey(Integer cid);

    int insert(Clazz record);

    Clazz selectByPrimaryKey(Integer cid);

    int updateByPrimaryKey(Clazz record);

    List<Clazz> getListClazz(Map<String, Object> map);

	Integer getCount();

	List<Clazz> getClazzByCertifyNo(String certifyno);
}