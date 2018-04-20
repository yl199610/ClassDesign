package com.yl.cd.web.handler;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yl.cd.entity.Cbook;
import com.yl.cd.entity.Ccategory;
import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.service.BookService;

@Controller
@RequestMapping("/cbook")
public class BookHandler {
	@Autowired
	private BookService bookService;

	// 模糊分页查询
	@RequestMapping("/list")
	@ResponseBody
	public PaginationBean<Cbook> getAllBook(String page, String rows, Cbook cbook) {
		LogManager.getLogger().debug("请求BookHandler处理getAllBook......");
		PaginationBean<Cbook> bookPage = bookService.getAllBook(page, rows, cbook);
		return bookPage;
	}
	
	//删除
	@RequestMapping("/archive")
	@ResponseBody
	public boolean archiveBook(@RequestParam(name="cbid")Integer cbid){
		LogManager.getLogger().debug("请求BookHandler处理archiveBook....\n"+cbid);
		return bookService.archiveBook(cbid);
	}
	
	@RequestMapping("/detail")
	@ResponseBody
	public Cbook detailBook(@RequestParam(name="cbid")Integer cbid){
		LogManager.getLogger().debug("请求BookHandler处理archiveBook....\n"+cbid);
		return bookService.detailBook(cbid);
	}
	
}