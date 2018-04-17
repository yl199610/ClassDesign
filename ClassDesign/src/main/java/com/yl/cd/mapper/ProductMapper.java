package com.yl.cd.mapper;

import java.util.List;
import java.util.Map;

import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.PaginationBean;

public interface ProductMapper {

	PaginationBean<Cproduct> getProductTotalAndTotalPage(Map<String, Object> map);

	List<Cproduct> getProductByName(Map<String, Object> map);

}
