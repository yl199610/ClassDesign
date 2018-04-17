package com.yl.cd.web.handler;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yl.cd.entity.Ccategory;
import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.service.ProductService;

@Controller
@RequestMapping("/cproduct")
public class ProductHandler {
	@Autowired
	private ProductService productService;

//	/**
//	 * 获得所有标题
//	 */
//	@RequestMapping("/list")
//	@ResponseBody
//	public PaginationBean<Cproduct> getAllProduct(String page, String rows) {
//		LogManager.getLogger().debug("请求ProductHandler处理getAllProduct......");
//		return productService.getAllProduct(page, rows);
//	}

	// 模糊分页查询
	@RequestMapping("/list")
	@ResponseBody
	public PaginationBean<Cproduct> getAllProduct(String page, String rows, Cproduct cproduct) {
		LogManager.getLogger().debug("请求ProductHandler处理getAllProduct......");
		PaginationBean<Cproduct> productPage = productService.getAllProduct(page, rows, cproduct);
		return productPage;
	}

}