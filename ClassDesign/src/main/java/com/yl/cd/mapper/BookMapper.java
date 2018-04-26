package com.yl.cd.mapper;

import java.util.List;
import java.util.Map;

import com.yl.cd.entity.Cbook;
import com.yl.cd.entity.PaginationBean;

public interface BookMapper {

	List<Cbook> getBookByName(Map<String, Object> map);

	PaginationBean<Cbook> getBookTotalAndTotalPage(Map<String, Object> map);

	boolean archiveBook(Integer cbid);

	Cbook detailBook(Integer cbid);

	List<Cbook> getAllBookNoPage();

	boolean modifyBook(Cbook cbook);

}
