package org.zyj.dao;

import java.util.List;
import java.util.Map;

import org.zyj.vo.Paycost;
import org.zyj.vo.PaycostKey;

public interface PaycostMapper {
    int deleteByPrimaryKey(PaycostKey key);

    int insert(Paycost record);

    int insertSelective(Paycost record);

    Paycost selectByPrimaryKey(PaycostKey key);

    int updateByPrimaryKeySelective(Paycost record);

    int updateByPrimaryKey(Paycost record);

	List<Paycost> getListPay(Map<String, Object> map);

	Integer getCount();
}