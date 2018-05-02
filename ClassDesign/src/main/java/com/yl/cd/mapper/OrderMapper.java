package com.yl.cd.mapper;

import java.util.List;
import java.util.Map;

import com.yl.cd.entity.Corder;
import com.yl.cd.entity.Corderitem;
import com.yl.cd.entity.PaginationBean;

public interface OrderMapper {
	List<Corder> getOrderByName(Map<String, Object> map);

	PaginationBean<Corder> getOrderTotalAndTotalPage(Map<String, Object> map);

	int insertCorder(Corder corder);

	boolean insertCorderDetail(Corderitem ci);

}
