package org.zyj.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zyj.service.PayCostService;
import org.zyj.utils.DataGrid;
import org.zyj.vo.Paycost;

@Controller
@RequestMapping("/pay")
public class PayController {

	@Resource
	private PayCostService payCostServiceImpl;
	
    @RequestMapping("/toListPay.do")
    public String toListUser(){
        return "pay/listpay";
    }

    @RequestMapping("/listPay.do")
    @ResponseBody
    public DataGrid<Paycost> getListUser(Integer page, Integer rows){
        DataGrid<Paycost> listPay = payCostServiceImpl.getListPay(page,rows);
        return listPay;
    }

	
}
