package com.yl.cd.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yl.cd.entity.Ccategory;
import com.yl.cd.entity.Ccomments;
import com.yl.cd.entity.Cfavorites;
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
	
	@Override
	public List<Cproduct> getAllHotProduct() {
		return productMapper.getAllHotProduct();
	}

	@Override
	public List<Cproduct> getAllCommProduct() {
		List<Ccomments> cfavorites = productMapper.getAllComCount();
		List<Cproduct> commentsList=new ArrayList<Cproduct>();
		Cproduct product=null;
		for (int i = 0; i < cfavorites.size(); i++) {
			Integer cfp = cfavorites.get(i).getCfp();
			String comCount = cfavorites.get(i).getComcount();
			product = productMapper.getAllCommProduct(cfp);
			product.setCkeywords(comCount);
			commentsList.add(product);
		}
		return commentsList;
	}

	@Override
	public List<Cproduct> getAllFavProduct() {
		List<Cfavorites> cfavorites = productMapper.getAllFavCount();
		List<Cproduct> cporoductList=new ArrayList<Cproduct>();
		Cproduct product=null;
		for (int i = 0; i < cfavorites.size(); i++) {
			Integer cfp = cfavorites.get(i).getCfp();
			String favCount = cfavorites.get(i).getFavcount();
			product = productMapper.getAllFavProduct(cfp);
			product.setCkeywords(favCount);
			cporoductList.add(product);
		}
		return cporoductList;
	}

	@Override
	public int getAllCountProduct() {
		return productMapper.getAllCountProduct();
	}

	@Override
	public List<Cproduct> getProductByMan() {
		return productMapper.getProductByMan();
	}
	

}
