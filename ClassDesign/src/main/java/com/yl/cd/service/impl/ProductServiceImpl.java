package com.yl.cd.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yl.cd.entity.Ccategory;
import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.mapper.ProductMapper;
import com.yl.cd.service.ProductService;

@Service("productService")
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductMapper productMapper;

	@Override
	public PaginationBean<Cproduct> getAllProduct(String currpage, String pageSize, Cproduct cproduct) {
		PaginationBean<Cproduct> productList = new PaginationBean<Cproduct>();
		Map<String, Object> map = new HashMap<String, Object>();
		if("".equals(currpage)||null==currpage){
			currpage=currpage.valueOf(1);
		}
		if("".equals(pageSize)||null==pageSize){
			pageSize=pageSize.valueOf(5);
		}
		String cproductname=cproduct.getCproductname();
		map.put("cproductname", cproductname);
		map.put("currPage", currpage);
		map.put("pageSize", pageSize);
		List<Cproduct> c = productMapper.getProductByName(map);
		//获得total 和 totalPage
		productList = productMapper.getProductTotalAndTotalPage(map);
		productList.setRows(c);
		return productList;
	}
	

}
