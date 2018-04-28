package com.yl.cd.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yl.cd.entity.Cbook;
import com.yl.cd.entity.Ccategory;
import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.mapper.BookMapper;
import com.yl.cd.service.BookService;

@Service("bookService")
public class BookServiceImpl implements BookService {
	@Autowired
	private BookMapper bookMapper;

	@Override
	public PaginationBean<Cbook> getAllBook(String currpage, String pageSize, Cbook cbook) {
		PaginationBean<Cbook> productList = new PaginationBean<Cbook>();
		Map<String, Object> map = new HashMap<String, Object>();
		if ("".equals(currpage) || null == currpage) {
			currpage = currpage.valueOf(1);
		}
		if ("".equals(pageSize) || null == pageSize) {
			pageSize = pageSize.valueOf(5);
		}
		String cisbn = cbook.getCisbn();
		String bookname = cbook.getBookname();
		String cauthor = cbook.getCauthor();
		map.put("bookname", bookname);
		map.put("cisbn", cisbn);
		map.put("cauthor", cauthor);
		map.put("currPage", currpage);
		map.put("pageSize", pageSize);
		List<Cbook> c = bookMapper.getBookByName(map);
		// 获得total 和 totalPage
		productList = bookMapper.getBookTotalAndTotalPage(map);
		productList.setRows(c);
		return productList;
	}

	@Override
	public boolean archiveBook(Integer cbid) {
		return bookMapper.archiveBook(cbid);
	}

	@Override
	public Cbook detailBook(Integer cbid) {
		return bookMapper.detailBook(cbid);
	}

	@Override
	public List<Cbook> getAllBookNoPage() {
		return bookMapper.getAllBookNoPage();
	}

	@Override
	public boolean modifyBook(Cbook cbook) {
		return bookMapper.modifyBook(cbook);
	}

	@Override
	public boolean addBook(Cbook cbook) {
		// 判断目录是否存在
		Cbook notExit = bookMapper.isExistBookName(cbook);
		if (notExit != null) {
			return false;
		}
		return bookMapper.addBook(cbook);
	}

}
