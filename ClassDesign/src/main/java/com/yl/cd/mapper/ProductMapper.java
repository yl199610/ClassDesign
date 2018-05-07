package com.yl.cd.mapper;

import java.util.List;
import java.util.Map;

import com.yl.cd.entity.Cbook;
import com.yl.cd.entity.Ccategory;
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

	boolean archiveProduct(Integer cuid);

	Cproduct detailProduct(Integer ccid);

	boolean modifyProduct(Cproduct cproduct);

	Cbook findBookName(Integer cbcpid);

	Cbook getBookMsgByBid(Integer cbid);

	boolean addProduct(Cproduct cproduct);

	List<Cproduct> getProductByCcid(Map<String, Object> map);

	PaginationBean<Cproduct> getTotalAndTotalProduct(Map<String, Object> map);

	PaginationBean<Cproduct> getTotalAndTotalProductByname(Map<String, Object> map);

	List<Cproduct> getProductByNameProduct(Map<String, Object> map);

	List<Cproduct> getTwoProduct();



}
