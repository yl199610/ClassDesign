package com.yl.cd.service;

import com.yl.cd.entity.Cfavorites;
import com.yl.cd.entity.PaginationBean;

public interface FavService {

	PaginationBean<Cfavorites> getAllFavorites(String page, String rows, Cfavorites cfavorites);

}
