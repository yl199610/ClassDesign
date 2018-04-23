package com.yl.cd.mapper;

import java.util.List;
import java.util.Map;

import com.yl.cd.entity.Ccomments;
import com.yl.cd.entity.Cfavorites;
import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.PaginationBean;

public interface ProductMapper {

	PaginationBean<Cproduct> getProductTotalAndTotalPage(Map<String, Object> map);

	List<Cproduct> getProductByName(Map<String, Object> map);
	
	List<Cproduct> getAllHotProduct();

	List<Ccomments> getAllComCount();

	Cproduct getAllCommProduct(Integer cfp);

	List<Cfavorites> getAllFavCount();
	
	Cproduct getAllFavProduct(Integer cfp);

	Integer getAllCountProduct();

	int getTotalPage();

	List<Cproduct> getProductByMan(PaginationBean<Cproduct> productBean);

	PaginationBean<Cproduct> getProductPageByMan(PaginationBean<Cproduct> productBean);


}
