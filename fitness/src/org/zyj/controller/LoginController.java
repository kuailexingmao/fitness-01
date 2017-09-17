package org.zyj.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zyj.service.LoginService;
import org.zyj.service.MenuService;
import org.zyj.vo.Emp;
import org.zyj.vo.Menu;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Resource
	private LoginService loginServiceImpl;
	@Resource
	private MenuService menuServiceImpl;
	
	@RequestMapping("/login.do")
	public void login(HttpServletResponse response,HttpServletRequest request,Emp emp) throws IOException{
		Emp checkEmp = loginServiceImpl.checkEmp(emp);
		if(checkEmp == null){
			response.getWriter().print(Boolean.FALSE);
		}
		request.getSession().setAttribute("empinfo", checkEmp);
		response.getWriter().print(Boolean.TRUE);
	}
	
	
	@RequestMapping("/layout.do")
	public String layout(ModelMap modelMap,HttpServletResponse response){
		List<Menu> showMenu = menuServiceImpl.getShowMenu();
		JSONArray fromObject = JSONArray.fromObject(showMenu);
		String json = fromObject.toString();
		System.out.println(json);
		modelMap.addAttribute("ztree",json);
		return "layout";
		
	}
}
