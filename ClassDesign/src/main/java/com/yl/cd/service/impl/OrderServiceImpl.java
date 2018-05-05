package com.yl.cd.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yl.cd.entity.Corder;
import com.yl.cd.entity.Corderitem;
import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.mapper.OrderMapper;
import com.yl.cd.mapper.ProductMapper;
import com.yl.cd.service.OrderService;

@Service("orderService")
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private ProductMapper productMapper;

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


	@Override@Transactional
	public boolean insertCorder(Corder corder, String num, String pricetotal, String spid) {
		//先插入到order表   同步插入到订单详细表
		Corderitem ci = new Corderitem();
		boolean result=true;
		int corid =orderMapper.insertCorder(corder);
		System.out.println(corder.getCoid());
		String []one =  spid.split(",");
		for (int i = 0; i < one.length; i++) {
			String []two =  one[i].split("-");
			ci.setCoinumber(two[1]);
			ci.setCobid(Integer.parseInt(two[0]));
			Cproduct cproduct = productMapper.getAllCommProduct(Integer.parseInt(two[0]));
			ci.setCiprice(cproduct.getCwsscprice());
			ci.setCorid(corder.getCoid());
			result =orderMapper.insertCorderDetail(ci);
		}
		return result;
	}


	@Override
	public boolean cancelOrder(String coid) {
		return orderMapper.cancelOrder(coid);
	}


	@Override
	public List<Corderitem> findorderDetail(String coid) {
		return orderMapper.findorderDetail(coid);
	}

}
