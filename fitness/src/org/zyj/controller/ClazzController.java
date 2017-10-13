package org.zyj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zyj.service.ClazzService;
import org.zyj.utisl.DataGrid;
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
}
