package org.zyj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("/emp")
public class EmpController {
	@RequestMapping("/addEmp.do")
	public String addEmp(){
		
		
		return "addemp";
	}
}
