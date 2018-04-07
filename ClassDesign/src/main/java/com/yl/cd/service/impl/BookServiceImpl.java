package com.yl.cd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yl.cd.entity.Cbook;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.mapper.BookMapper;
import com.yl.cd.service.BookService;

@Service("bookService")
public class BookServiceImpl implements BookService{
	@Autowired
	private BookMapper bookMapper;


	@Override
	public PaginationBean<Cbook> getAllBook(String currpage, String pageSize) {
		PaginationBean<Cbook> bookBean = new PaginationBean<Cbook>();
		if(currpage!=null){
			bookBean.setCurrPage(Integer.parseInt(currpage));
		}
		
		if(pageSize!=null){
			bookBean.setPageSize(Integer.parseInt(pageSize));
		}
		return bookMapper.getAllBook(bookBean);
	}

}
