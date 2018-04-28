package com.yl.cd.web.handler;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yl.cd.entity.Cbook;
import com.yl.cd.entity.Ccategory;
import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.service.BookService;
import com.yl.cd.util.ServletUtil;

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

	// 获得所有书籍不分页
	@RequestMapping("/listallbook")
	@ResponseBody
	public List<Cbook> getAllBookNoPage() {
		LogManager.getLogger().debug("请求BookHandler处理getAllBookNoPage......");
		List<Cbook> bookPage = bookService.getAllBookNoPage();
		System.out.println("==============" + bookPage);
		return bookPage;
	}

	// 删除
	@RequestMapping("/archive")
	@ResponseBody
	public boolean archiveBook(@RequestParam(name = "cbid") Integer cbid) {
		LogManager.getLogger().debug("请求BookHandler处理archiveBook....\n" + cbid);
		return bookService.archiveBook(cbid);
	}

	@RequestMapping("/detail")
	@ResponseBody
	public Cbook detailBook(@RequestParam(name = "cbid") Integer cbid) {
		LogManager.getLogger().debug("请求BookHandler处理detailBook....\n" + cbid);
		return bookService.detailBook(cbid);
	}

	// 修改
	@RequestMapping("/modify")
	@ResponseBody
	public boolean modifyBook(@RequestParam(name = "picData", required = false) MultipartFile picData,Cbook cbook) {
		LogManager.getLogger().debug("请求BookHandler处理modify...." + cbook);
		if (picData != null) {
			try {
				picData.transferTo(new File(ServletUtil.UPLOAD_DIR, picData.getOriginalFilename()));
				cbook.setCimage("/" + ServletUtil.UPLOAD_DIR_NAME + "/" + picData.getOriginalFilename());// 图片上传
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return bookService.modifyBook(cbook);
	}
	
	// 书籍的添加
	@RequestMapping("/add")
	@ResponseBody
	public boolean addBook(@RequestParam(name = "picData", required = false) MultipartFile picData,Cbook cbook) {
		LogManager.getLogger().debug("请求BookHandler处理addBook...." + cbook);
		if (picData != null) {
			try {
				picData.transferTo(new File(ServletUtil.UPLOAD_DIR, picData.getOriginalFilename()));
				cbook.setCimage("/" + ServletUtil.UPLOAD_DIR_NAME + "/" + picData.getOriginalFilename());// 图片上传
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return bookService.addBook(cbook);
	}

}