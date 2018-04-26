package com.yl.cd.web.handler;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.yl.cd.entity.Cadmin;
import com.yl.cd.service.CadminService;

@Controller
@RequestMapping("/cadmin")
@SessionAttributes("loginAdmin")
public class CadminHandler{
	@Autowired
	private CadminService cadminService;
	
	/**
	 * 管理员登录
	 */
	@RequestMapping("/alogin")
	public String adminLogin(Cadmin admin,ModelMap map){
		LogManager.getLogger().debug("请求CadminHandler处理adminLogin......"+admin);
		admin=cadminService.adminLogin(admin);
		if(admin!=null){
			map.put("loginAdmin",admin);
			return "redirect:/page/manage.jsp";
		}
		map.put("errorMsg","用户名或密码错误");
		return "forward:/manageLogin.jsp";
	}	

}