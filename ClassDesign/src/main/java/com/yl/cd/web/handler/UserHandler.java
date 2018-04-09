package com.yl.cd.web.handler;

import java.io.File;
import java.io.IOException;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yl.cd.entity.Cuser;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.service.UserService;
import com.yl.cd.util.ServletUtil;

@Controller
@RequestMapping("/cuser")
public class UserHandler{
	@Autowired
	private UserService userService;
	

	/**
	 * 分页显示用户信息
	 */
	@RequestMapping("/userlist")
	@ResponseBody
	public PaginationBean<Cuser> userList(String page,String rows){
		LogManager.getLogger().debug("请求UserHandler处理list...."+page+"----"+rows);
		return userService.listPartUser(page,rows);
	}
	
	@RequestMapping("/modify")
	@ResponseBody
	public boolean modify(@RequestParam(name="picData",required=false)MultipartFile picData,Cuser cuser){
		LogManager.getLogger().debug("请求userHandler处理modify...."+cuser);
		
		if(picData!=null){
			try {
				picData.transferTo(new File(ServletUtil.UPLOAD_DIR,picData.getOriginalFilename()));
				cuser.setCphoto("/"+ServletUtil.UPLOAD_DIR_NAME+"/"+picData.getOriginalFilename());//图片上传
			System.out.println("picData.getOriginalFilename()"+picData.getOriginalFilename());
			System.out.println("picData.ServletUtil.UPLOAD_DIR()"+ServletUtil.UPLOAD_DIR);	
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
	return false;
		//return userService.modifyUser(cuser);
	}

}