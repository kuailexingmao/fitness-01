package org.zyj.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zyj.service.VipService;
import org.zyj.vo.User;


@Controller
@RequestMapping("/vip")
public class VipController {
	 @Resource
	 private VipService vipService;
	 
	   @RequestMapping("/tovip.do")
	    public String toVip(){
	        return "user/addVip";
	    }

	   @RequestMapping("/tovipcode.do")
	    public Map<String, Object> toVipCode(HttpServletRequest request){
		   Map<String, Object> dataMap = new HashMap<String, Object>();
		   String idNo = (String) request.getParameter("idNo");
		   User user = vipService.findById(idNo);
		   dataMap.put("user", user);
	        return dataMap;
	    }
	 
	   @RequestMapping("/tovipcode.do")
	    public void addvip(String vipNo , String vipDate , String idNo){
		   User user = new User();
		   user.setVipcardid(vipNo);
		   user.setViptime(vipDate);
		   user.setCertifyno(idNo);
		   user.setIsvip("1");
		   vipService.addvip(user);
		   
	    }

}
