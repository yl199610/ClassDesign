package com.yl.cd.web.handler;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yl.cd.entity.Cfavorites;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.service.FavService;

@Controller
@RequestMapping("/cfav")
public class FavHandler{
	@Autowired
	private FavService favService;
	

	@RequestMapping("/list")
	@ResponseBody
	public PaginationBean<Cfavorites> getAllFav(String page,String rows){
		LogManager.getLogger().debug("请求FavHandler处理getAllBook......");
		return favService.getAllFav(page,rows);
	}
	
}