package org.zyj.dao;

import org.zyj.vo.Tcu;

public interface TcuMapper {
    int insert(Tcu record);

    int insertSelective(Tcu record);

	int deleteByCertifyno(String certifyno);
}