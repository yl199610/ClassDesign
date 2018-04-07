package com.yl.cd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.mapper.ProductMapper;
import com.yl.cd.service.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductMapper productMapper;

	@Override
	public PaginationBean<Cproduct> getAllProduct(String currpage, String pageSize) {
		PaginationBean<Cproduct> productBean = new PaginationBean<Cproduct>();
		if(currpage!=null){
			productBean.setCurrPage(Integer.parseInt(currpage));
		}
		
		if(pageSize!=null){
			productBean.setPageSize(Integer.parseInt(pageSize));
		}
		return productMapper.getAllProduct(productBean);
	}
	

}
