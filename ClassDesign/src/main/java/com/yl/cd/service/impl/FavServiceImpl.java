package com.yl.cd.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public PaginationBean<Cfavorites> getAllFavorites(String currpage, String pageSize, Cfavorites cfavorites) {
		PaginationBean<Cfavorites> productList = new PaginationBean<Cfavorites>();
		Map<String, Object> map = new HashMap<String, Object>();
		if("".equals(currpage)||null==currpage){
			currpage=currpage.valueOf(1);
		}
		if("".equals(pageSize)||null==pageSize){
			pageSize=pageSize.valueOf(5);
		}
		Integer cuserid = cfavorites.getCuserid();
		Integer cfp = cfavorites.getCfp();
		String cfstatus = cfavorites.getCfstatus();
		map.put("cfstatus", cfstatus);
		map.put("cuserid", cuserid);
		map.put("cfp", cfp);
		map.put("currPage", currpage);
		map.put("pageSize", pageSize);
		List<Cfavorites> c = favMapper.getFavoriteByName(map);
		//获得total 和 totalPage
		productList = favMapper.getFavoriteTotalAndTotalPage(map);
		productList.setRows(c);
		return productList;
	}

	@Override
	public boolean saveFavorites(Cfavorites fav) {
		Cfavorites c = favMapper.findFavBypidAndCuid(fav);
		if(c==null){
			return favMapper.saveFavorites(fav);
		}else{
			return false;
		}
	}

}
