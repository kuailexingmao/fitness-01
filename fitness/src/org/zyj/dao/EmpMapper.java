package org.zyj.dao;

import org.zyj.vo.Emp;

public interface EmpMapper {
    int deleteByPrimaryKey(Integer eid);

    int insert(Emp record);

    Emp checkEmp(Emp emp);

    int updateByPrimaryKey(Emp record);
}