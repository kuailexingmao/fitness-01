package org.zyj.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.http.HttpOutputMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zyj.service.EmpService;
import org.zyj.utisl.DataGrid;
import org.zyj.vo.Emp;
@Controller
@RequestMapping("/emp")
public class EmpController {
	
	@Resource
	private EmpService empServiceImpl;
	
	@RequestMapping("/toAddEmp.do")
	public String addEmp(){
		
		return "emp/addemp";
	}
	
	@RequestMapping("/toListEmp.do")
	public String toListEmp(){
		
		return "emp/listEmp";
	}
	
	@RequestMapping("/listEmp.do")
	@ResponseBody
	public DataGrid<Emp> getListEmp(Integer page,Integer rows){
		DataGrid<Emp> listEmp = empServiceImpl.getListEmp(page,rows);
		return listEmp;
	}
}
