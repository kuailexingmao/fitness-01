package org.zyj.service;

import java.util.List;

import org.zyj.utisl.DataGrid;
import org.zyj.vo.Emp;

public interface EmpService {

	DataGrid<Emp> getListEmp(Integer page, Integer rows);
}
