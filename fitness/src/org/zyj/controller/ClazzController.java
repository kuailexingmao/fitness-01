package org.zyj.controller;

import java.text.ParseException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zyj.service.ClazzService;
import org.zyj.utils.DataGrid;
import org.zyj.vo.Clazz;

import javax.annotation.Resource;

/**
 * Created by zyj on 2017/10/12.
 */
@Controller
@RequestMapping("/clazz")
public class ClazzController {

    @Resource
    private ClazzService clazzServiceImpl;

    @RequestMapping("/toListClazz.do")
    public String toListClazz(){
        return "clazz/listClazz";
    }

    @RequestMapping("/listClazz.do")
    @ResponseBody
    public DataGrid<Clazz> getListClazz(Integer page, Integer rows){
        DataGrid<Clazz> listClazz = clazzServiceImpl.getListClazz(page,rows);
        return listClazz;
    }
    
	@RequestMapping("/deleteClazz.do")
	public String deleteEmp(Integer cid){
		clazzServiceImpl.deleteClazz(cid);
		return "clazz/successdel";
	}
	
	@RequestMapping("/toAddClazz.do")
	public String toAddClazz(){
		return "clazz/addClazz";
	}
	
	@RequestMapping("/addClazz.do")
	public String addClazz(Clazz clazz) throws ParseException{
		clazzServiceImpl.addClazz(clazz);
		return "redirect:/clazz/toListClazz.do";
	}
	
	@RequestMapping("/toUpdateClazz.do")
	public String toUpdateClazz(ModelMap modelMap, Integer cid){
		Clazz clazzByCid = clazzServiceImpl.findClazzByCid(cid);
		modelMap.addAttribute("clazz", clazzByCid);
		return "clazz/updateClazz";
	}
	
	@RequestMapping("/updateClazz.do")
	public String updateClazz(Clazz clazz) throws ParseException{
		clazzServiceImpl.updateClazz(clazz);
		return "redirect:/clazz/toListClazz.do";
		
	}
}
