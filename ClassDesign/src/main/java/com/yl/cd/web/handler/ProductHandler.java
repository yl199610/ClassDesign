package com.yl.cd.web.handler;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yl.cd.entity.Ccategory;
import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.Cuser;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.service.ProductService;
import com.yl.cd.util.JsoupGetBook;
import com.yl.cd.util.ServletUtil;

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
	public Integer getAllCountProduct() {
		LogManager.getLogger().debug("请求ProductHandler处理getAllCountProduct......");
		Integer count = productService.getAllCountProduct();
		return count;
	}

	// 首页页面加载获取图书推荐
	@RequestMapping("/getproductbyman")
	@ResponseBody
	public PaginationBean<Cproduct> getProductByMan(HttpServletRequest request) {
		LogManager.getLogger().debug("请求ProductHandler处理getProductByMan......"+request.getParameter("pageNos"));
		String page = request.getParameter("pageNos");
		PaginationBean<Cproduct> cproductList = new PaginationBean<Cproduct>();
		if("".equals(page)||page==null){
			page=String.valueOf(cproductList.getCurrPage());
		}
		String rows = "2";
		cproductList = productService.getProductByMan(page,rows);
		return cproductList;
	}

	// 首页加载爬虫数据
	@RequestMapping("/getjsoupdata")
	@ResponseBody
	public List<Cproduct> getJsoupData() {
		LogManager.getLogger().debug("请求ProductHandler处理getJsoupData......");
		List<Cproduct> cproductList = JsoupGetBook.getTopMsg();
		return cproductList;
	}
	
	/**
	 * 删除产品
	 */
	@RequestMapping("/archive")
	@ResponseBody
	public boolean archiveProduct(@RequestParam(name="cuid")Integer cuid){
		LogManager.getLogger().debug("请求ProductHandler处理delete....\n"+cuid);
		return productService.archiveProduct(cuid);
	}
	
	//获取详情
	@RequestMapping("/detail")
	@ResponseBody
	public Cproduct detailProduct(@RequestParam(name="ccid")Integer ccid){
		LogManager.getLogger().debug("请求ProductHandler处理detailProduct....\n"+ccid);
		return productService.detailProduct(ccid);
	}
	
	//修改
	@RequestMapping("/modify")	
	@ResponseBody
	public boolean modifyProduct(@RequestParam(name="picData",required=false)MultipartFile picData, Cproduct cproduct){
		LogManager.getLogger().debug("请求ProductHandler处理modify...."+cproduct);
		if(picData!=null){
			try {
				picData.transferTo(new File(ServletUtil.UPLOAD_DIR,picData.getOriginalFilename()));
				cproduct.setCimage("/"+ServletUtil.UPLOAD_DIR_NAME+"/"+picData.getOriginalFilename());//图片上传
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return productService.modifyProduct(cproduct);
	}
	
}