package com.yl.cd.mapper;

import java.util.List;
import java.util.Map;

import com.yl.cd.entity.Cbook;
import com.yl.cd.entity.PaginationBean;

public interface BookMapper {

	List<Cbook> getBookByName(Map<String, Object> map);

	PaginationBean<Cbook> getBookTotalAndTotalPage(Map<String, Object> map);

}
