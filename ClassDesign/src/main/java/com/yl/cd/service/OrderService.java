package com.yl.cd.service;

import com.yl.cd.entity.Corder;
import com.yl.cd.entity.PaginationBean;

public interface OrderService {

	PaginationBean<Corder> getAllCorder(String page, String rows, Corder corder);

	boolean insertCorder(Corder corder, String num, String pricetotal, String spid);

}
