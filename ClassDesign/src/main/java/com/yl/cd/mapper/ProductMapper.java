package com.yl.cd.mapper;

import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.PaginationBean;

public interface ProductMapper {

	PaginationBean<Cproduct> getAllProduct(PaginationBean<Cproduct> productBean);

}
