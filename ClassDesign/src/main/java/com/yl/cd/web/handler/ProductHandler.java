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

	// 模糊分页查询
	@RequestMapping("/list")
	@ResponseBody
	public PaginationBean<Cproduct> getAllProduct(String page, String rows, Cproduct cproduct) {
		LogManager.getLogger().debug("请求ProductHandler处理getAllProduct......");
		PaginationBean<Cproduct> productPage = productService.getAllProduct(page, rows, cproduct);
		return productPage;
	}

	// 首页页面加载热卖图书
	@RequestMapping("/gethotproduct")
	@ResponseBody
	public List<Cproduct> getAllHotProduct() {
		LogManager.getLogger().debug("请求ProductHandler处理getAllHotProduct......");
		List<Cproduct> cproductList = productService.getAllHotProduct();
		return cproductList;
	}

	// 首页页面加载评论最多图书
	@RequestMapping("/getcomproduct")
	@ResponseBody
	public List<Cproduct> getAllCommProduct() {
		LogManager.getLogger().debug("请求ProductHandler处理getAllCommProduct......");
		List<Cproduct> cproductList = productService.getAllCommProduct();
		return cproductList;
	}

	// 首页页面加载收藏最多图书
	@RequestMapping("/getfavproduct")
	@ResponseBody
	public List<Cproduct> getAllFavProduct() {
		LogManager.getLogger().debug("请求ProductHandler处理getAllFavProduct......");
		List<Cproduct> cproductList = productService.getAllFavProduct();
		return cproductList;
	}

	// 首页页面加载获取图书总数
	@RequestMapping("/getcountproduct")
	@ResponseBody
	public int getAllCountProduct() {
		LogManager.getLogger().debug("请求ProductHandler处理getAllCountProduct......");
		int count = productService.getAllCountProduct();
		return count;
	}

	// 首页页面加载获取图书推荐
	@RequestMapping("/getproductbyman")
	@ResponseBody
	public List<Cproduct> getProductByMan() {
		LogManager.getLogger().debug("请求ProductHandler处理getProductByMan......");
		List<Cproduct> cproductList = productService.getProductByMan();
		return cproductList;
	}

}