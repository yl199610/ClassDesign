package com.yl.cd.service;

import java.util.List;

import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.PaginationBean;

public interface ProductService {

	PaginationBean<Cproduct> getAllProduct(String page, String rows, Cproduct cproduct);
	
	List<Cproduct> getAllHotProduct();

	List<Cproduct> getAllCommProduct();

	List<Cproduct> getAllFavProduct();

	Integer getAllCountProduct();

	int getTotalPage();

	PaginationBean<Cproduct> getProductByMan(String page, String rows);

	boolean archiveProduct(Integer cuid);

	Cproduct detailProduct(Integer ccid);

	boolean modifyProduct(Cproduct cproduct);

}
