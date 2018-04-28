package com.yl.cd.service;

import java.util.List;

import com.yl.cd.entity.Cbook;
import com.yl.cd.entity.PaginationBean;

public interface BookService {

	PaginationBean<Cbook> getAllBook(String page, String rows, Cbook cbook);

	boolean archiveBook(Integer cbid);

	Cbook detailBook(Integer cbid);

	List<Cbook> getAllBookNoPage();

	boolean modifyBook(Cbook cbook);

	boolean addBook(Cbook cbook);

}
