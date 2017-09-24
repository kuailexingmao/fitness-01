package org.zyj.dao;

import java.util.List;
import java.util.Map;

import org.zyj.vo.Emp;

public interface EmpMapper {
    int deleteByPrimaryKey(Integer eid);

    int insert(Emp record);

    Emp checkEmp(Emp emp);

    int updateByPrimaryKey(Emp record);

	List<Emp> getListEmp(Map<String, Object> map);

	Integer getCount();
}