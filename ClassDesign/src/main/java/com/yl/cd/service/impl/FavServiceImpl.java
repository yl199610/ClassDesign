package com.yl.cd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yl.cd.entity.Cfavorites;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.mapper.FavMapper;
import com.yl.cd.service.FavService;

@Service("favService")
public class FavServiceImpl implements FavService{
	@Autowired
	private FavMapper favMapper;


	@Override
	public PaginationBean<Cfavorites> getAllFav(String currpage, String pageSize) {
		PaginationBean<Cfavorites> bookBean = new PaginationBean<Cfavorites>();
		if(currpage!=null){
			bookBean.setCurrPage(Integer.parseInt(currpage));
		}
		
		if(pageSize!=null){
			bookBean.setPageSize(Integer.parseInt(pageSize));
		}
		return favMapper.getAllFav(bookBean);
	}

}
