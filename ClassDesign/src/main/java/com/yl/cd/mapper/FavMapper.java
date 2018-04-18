package com.yl.cd.mapper;

import java.util.List;
import java.util.Map;

import com.yl.cd.entity.Cfavorites;
import com.yl.cd.entity.PaginationBean;

public interface FavMapper {

	List<Cfavorites> getFavoriteByName(Map<String, Object> map);

	PaginationBean<Cfavorites> getFavoriteTotalAndTotalPage(Map<String, Object> map);

}
