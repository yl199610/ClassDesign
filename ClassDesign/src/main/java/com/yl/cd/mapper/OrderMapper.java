package com.yl.cd.mapper;

import java.util.List;
import java.util.Map;

import com.yl.cd.entity.Corder;
import com.yl.cd.entity.PaginationBean;

public interface OrderMapper {
	List<Corder> getOrderByName(Map<String, Object> map);

	PaginationBean<Corder> getOrderTotalAndTotalPage(Map<String, Object> map);

}
