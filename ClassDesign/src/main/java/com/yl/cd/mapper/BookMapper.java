package com.yl.cd.mapper;

import com.yl.cd.entity.Cbook;
import com.yl.cd.entity.PaginationBean;

public interface BookMapper {

	PaginationBean<Cbook> getAllBook(PaginationBean<Cbook> bookBean);

}
