package com.yl.cd.web.handler;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yl.cd.entity.Cfavorites;
import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.service.FavService;

@Controller
@RequestMapping("/cfav")
public class FavHandler{
	@Autowired
	private FavService favService;
	
	// 模糊分页查询
	@RequestMapping("/list")
	@ResponseBody
	public PaginationBean<Cfavorites> getAllFavorites(String page, String rows, Cfavorites cfavorites) {
		LogManager.getLogger().debug("请求FavHandler处理getAllFavorites......");
		PaginationBean<Cfavorites> favoritesPage = favService.getAllFavorites(page, rows, cfavorites);
		return favoritesPage;
	}

}