package org.zyj.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.zyj.service.ClazzService;
import org.zyj.service.UserService;
import org.zyj.utils.DataGrid;
import org.zyj.vo.User;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by zyj on 2017/10/12.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userServiceImpl;
    
    @Resource
    private ClazzService clazzServiceImpl;

    @RequestMapping("/toListUser.do")
    public String toListUser(){
        return "user/listUser";
    }

    @RequestMapping("/listUser.do")
    @ResponseBody
    public DataGrid<User> getListUser(Integer page, Integer rows){
        DataGrid<User> listUser = userServiceImpl.getListUser(page,rows);
        return listUser;
    }

    @RequestMapping("/deleteUser.do")
    public String deleteUser(Integer uid){
    	User user = userServiceImpl.findUserByUid(uid);
        userServiceImpl.deleteUser(user.getCertifyno());
        return "user/successdel";
    }
    
    @RequestMapping("/toUpdateUser.do")
    public String toUpdateUser(ModelMap modelMap,Integer uid){
    	User user = userServiceImpl.findUserByUid(uid);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String opentime = sdf.format(user.getOpentime());
		modelMap.addAttribute("user", user);
		modelMap.addAttribute("opentime", opentime);
        return "user/updateUser";
    }
    
	@RequestMapping("/updateUser.do")
	public String updateEmp(User user, String time) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date=sdf.parse(time);
		user.setOpentime(date);
		userServiceImpl.updateUser(user);
		return "redirect:/user/toListUser.do";
	}
	
	@RequestMapping("/toAddUser.do")
	public String toaddUser(){
		return "user/addUser";
	}
	
	@RequestMapping("/addUser.do")
	public String addUser(User user, String time) throws ParseException{
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date=sdf.parse(time);
		user.setOpentime(date);
		userServiceImpl.addUser(user);
		return "redirect:/user/toListUser.do";
	}
	
	@RequestMapping("/getClazz.do")
	public void getClazz(Integer uid,HttpServletResponse response) throws IOException{
		User userByUid = userServiceImpl.findUserByUid(uid);
		String listClazz = clazzServiceImpl.getClazzByCertifyNo(userByUid.getCertifyno());
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(listClazz);
	}

	@RequestMapping("/exportuser")
	public String exportUser(HttpServletResponse response) throws IOException{
		List<User> listUser = userServiceImpl.find();
		response.setContentType("application/x-excel");
		response.setHeader("Content-Disposition", "attachment;filename=" + new String("用户列表.xls".getBytes(), "ISO-8859-1"));
		ServletOutputStream outputStream = response.getOutputStream();
		userServiceImpl.exportExcel(listUser,outputStream);
		if (outputStream != null) {
			outputStream.close();
		}

		return "uploadfile/success";
	}

	@RequestMapping("/importuser")
	public String importuser(HttpServletRequest request, @RequestParam("excel") MultipartFile file) throws
			IOException{

		if(file!= null)
		{
			InputStream inputStream = file.getInputStream();
			String fileName = file.getOriginalFilename();

			//判断是否是Excel文件
			if(fileName.matches("^.+\\.(?i)((xls)|(xlsx))$"))
			{
				userServiceImpl.importExcel(inputStream, fileName);
			}
		}

		return "uploadfile/success";
	}
}
