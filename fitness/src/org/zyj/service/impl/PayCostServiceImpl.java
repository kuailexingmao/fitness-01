package org.zyj.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.zyj.dao.PaycostMapper;
import org.zyj.service.PayCostService;
import org.zyj.utils.DataGrid;
import org.zyj.vo.Paycost;

@Service
public class PayCostServiceImpl implements PayCostService {

	@Resource
	private PaycostMapper paycostMapperDao; 
	
	@Override
	public DataGrid<Paycost> getListPay(Integer page, Integer rows) {
		Map<String,Object> map = new HashMap<String, Object>();
        map.put("start",(page-1)*rows);
        map.put("size",rows);
        List<Paycost> listPay = paycostMapperDao.getListPay(map);
        Integer count =  paycostMapperDao.getCount();
        DataGrid<Paycost> dataPay = new DataGrid<Paycost>();
        dataPay.setRows(listPay);
        dataPay.setTotal(count);
		return dataPay;
	}

}
