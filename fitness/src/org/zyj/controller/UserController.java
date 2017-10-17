package org.zyj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zyj.service.UserService;
import org.zyj.utils.DataGrid;
import org.zyj.vo.User;

import javax.annotation.Resource;

/**
 * Created by zyj on 2017/10/12.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userServiceImpl;

    @RequestMapping("/toListUser.do")
    public String toListClazz(){
        return "user/listUser";
    }

    @RequestMapping("/listUser.do")
    @ResponseBody
    public DataGrid<User> getListClazz(Integer page, Integer rows){
        DataGrid<User> listUser = userServiceImpl.getListUser(page,rows);
        return listUser;
    }
}
