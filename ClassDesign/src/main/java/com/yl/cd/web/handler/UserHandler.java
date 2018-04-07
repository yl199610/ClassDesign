package com.yl.cd.web.handler;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yl.cd.entity.Cuser;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.service.UserService;

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
	

}