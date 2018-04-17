package com.yl.cd.service;

import com.yl.cd.entity.Cbook;
import com.yl.cd.entity.PaginationBean;

public interface BookService {

	PaginationBean<Cbook> getAllBook(String page, String rows, Cbook cbook);

}
