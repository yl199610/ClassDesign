package com.yl.cd.mapper;

import com.yl.cd.entity.Corder;
import com.yl.cd.entity.PaginationBean;

public interface OrderMapper {

	PaginationBean<Corder> getAllOrder(PaginationBean<Corder> orderBean);

}
