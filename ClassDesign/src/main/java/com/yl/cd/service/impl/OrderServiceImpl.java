package com.yl.cd.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yl.cd.entity.Corder;
import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.mapper.OrderMapper;
import com.yl.cd.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderMapper orderMapper;


	@Override
	public PaginationBean<Corder> getAllCorder(String currpage, String pageSize, Corder corder) {
		PaginationBean<Corder> orderList = new PaginationBean<Corder>();
		Map<String, Object> map = new HashMap<String, Object>();
		if("".equals(currpage)||null==currpage){
			currpage=currpage.valueOf(1);
		}
		if("".equals(pageSize)||null==pageSize){
			pageSize=pageSize.valueOf(5);
		}
		Integer coid=corder.getCoid();
		Integer cordid=corder.getCordid();
		map.put("coid", coid);
		map.put("cordid", cordid);
		map.put("currPage", currpage);
		map.put("pageSize", pageSize);
		List<Corder> c = orderMapper.getOrderByName(map);
		//获得total 和 totalPage
		orderList = orderMapper.getOrderTotalAndTotalPage(map);
		orderList.setRows(c);
		return orderList;
	}

}
