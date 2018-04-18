package com.yl.cd.web.handler;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yl.cd.entity.Corder;
import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.service.OrderService;

@Controller
@RequestMapping("/corder")
public class OrderHandler{
	@Autowired
	private OrderService orderService;
	
	// 模糊分页查询
	@RequestMapping("/list")
	@ResponseBody
	public PaginationBean<Corder> getAllCorder(String page, String rows, Corder corder) {
		LogManager.getLogger().debug("请求OrderHandler处理getAllCorder......");
		PaginationBean<Corder> productPage = orderService.getAllCorder(page, rows, corder);
		return productPage;
	}
}