package org.zyj.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.zyj.dao.EmpMapper;
import org.zyj.service.EmpService;
import org.zyj.utisl.DataGrid;
import org.zyj.vo.Emp;

@Service
public class EmpServiceImpl implements EmpService {

	@Resource
	private EmpMapper empMapperDao;

	public DataGrid<Emp> getListEmp(Integer page, Integer rows) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("start",(page-1)*rows);
		map.put("size",rows);
		List<Emp> listEmp = empMapperDao.getListEmp(map);
		Integer total = empMapperDao.getCount();
		DataGrid<Emp> dataEmp = new DataGrid<Emp>();
		dataEmp.setRows(listEmp);
		dataEmp.setTotal(total);
		return dataEmp;
	}
	
	
}
