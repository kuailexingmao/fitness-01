package org.zyj.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
	public String toaddEmp(){
		return "emp/addemp";
	}
	
	@RequestMapping("/addEmp.do")
	public String addEmp(Emp emp, String time) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
		java.util.Date date=sdf.parse(time);
		emp.setJointime(date);
		empServiceImpl.addEmp(emp);
		return "redirect:/emp/toListEmp.do";
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
	
	@RequestMapping("/toUpdateEmp.do")
	public String toUpdateEmp(ModelMap modelMap, Integer eid){
		Emp emp = empServiceImpl.findEmpByEid(eid);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String jointime = sdf.format(emp.getJointime());
		modelMap.addAttribute("emp", emp);
		modelMap.addAttribute("jointime", jointime);
		return "emp/updateEmp";
	}
	
	@RequestMapping("/updateEmp.do")
	public String updateEmp(Emp emp, String time) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//小写的mm表示的是分钟  
		java.util.Date date=sdf.parse(time);
		emp.setJointime(date);
		empServiceImpl.updateEmp(emp);
		return "redirect:/emp/toListEmp.do";
		
	}
	
	@RequestMapping("/deleteEmp.do")
	public String deleteEmp(Integer eid){
		empServiceImpl.deleteEmp(eid);
		return "emp/successdel";
	}
}
