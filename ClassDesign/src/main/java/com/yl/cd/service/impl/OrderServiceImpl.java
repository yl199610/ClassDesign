package com.yl.cd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yl.cd.entity.Corder;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.mapper.OrderMapper;
import com.yl.cd.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderMapper orderMapper;


	@Override
	public PaginationBean<Corder> getAllOrder(String currpage, String pageSize) {
		PaginationBean<Corder> orderBean = new PaginationBean<Corder>();
		if(currpage!=null){
			orderBean.setCurrPage(Integer.parseInt(currpage));
		}
		
		if(pageSize!=null){
			orderBean.setPageSize(Integer.parseInt(pageSize));
		}
		return orderMapper.getAllOrder(orderBean);
	}

}
