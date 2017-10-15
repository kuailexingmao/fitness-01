package org.zyj.dao;

import org.zyj.vo.Class;

public interface ClassMapper {
    int deleteByPrimaryKey(Integer cid);

    int insert(Class record);

    int insertSelective(Class record);

    Class selectByPrimaryKey(Integer cid);

    int updateByPrimaryKeySelective(Class record);

    int updateByPrimaryKey(Class record);
}