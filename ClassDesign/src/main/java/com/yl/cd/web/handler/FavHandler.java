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
	
	
	// 图书收藏
	@RequestMapping("/favbook")
	@ResponseBody
	public boolean saveFavorites(String cfp, String cuserid) {
		LogManager.getLogger().debug(cfp+"请求FavHandler处理saveFavorites......"+cuserid);
		Cfavorites fav = new Cfavorites();
		fav.setCfp(Integer.parseInt(cfp));
		fav.setCuserid(Integer.parseInt(cuserid));
		return favService.saveFavorites(fav);
	}
	
	//显示用户的收藏
	@RequestMapping("/listuserfav")
	@ResponseBody
	public PaginationBean<Cfavorites> listuserFav(String page, String rows,String cuid) {
		LogManager.getLogger().debug("请求FavHandler处理getAllFavorites......"+cuid);
		Cfavorites cfavorites = new Cfavorites();
		cfavorites.setCuserid(Integer.parseInt(cuid));
		PaginationBean<Cfavorites> favoritesPage = favService.getAllFavorites(page, rows, cfavorites);
		return favoritesPage;
	}
	

}