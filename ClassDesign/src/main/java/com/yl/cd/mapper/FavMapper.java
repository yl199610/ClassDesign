package com.yl.cd.mapper;

import com.yl.cd.entity.Cfavorites;
import com.yl.cd.entity.PaginationBean;

public interface FavMapper {

	PaginationBean<Cfavorites> getAllFav(PaginationBean<Cfavorites> bookBean);

}
