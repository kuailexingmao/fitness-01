package org.zyj.service;

import org.zyj.utils.DataGrid;
import org.zyj.vo.Emp;

public interface EmpService {

	DataGrid<Emp> getListEmp(Integer page, Integer rows);

	void deleteEmp(Integer eid);

	Emp findEmpByEid(Integer eid);

	void updateEmp(Emp emp);

	void addEmp(Emp emp);
}
