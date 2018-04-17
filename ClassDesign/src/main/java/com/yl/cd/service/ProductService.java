package com.yl.cd.service;

import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.PaginationBean;

public interface ProductService {

	PaginationBean<Cproduct> getAllProduct(String page, String rows, Cproduct cproduct);

}
