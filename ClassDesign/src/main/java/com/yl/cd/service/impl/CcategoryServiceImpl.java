package com.yl.cd.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yl.cd.entity.Ccategory;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.mapper.CcategoryMapper;
import com.yl.cd.service.CcategoryService;

@Service("ccategoryService")
public class CcategoryServiceImpl implements CcategoryService{
	@Autowired
	private CcategoryMapper CcategoryMapper;
	
	@Override
	public List<Ccategory> getAllOnetype() {
		return CcategoryMapper.getAllOnetype();
	}

	@Override
	public List<Ccategory> getAllTwotype(int ccid) {
		return CcategoryMapper.getAllTwotype(ccid);
	}

	@Override
	public Ccategory getAllThreetype(int ccid) {
		return CcategoryMapper.getAllThreetype(ccid);
	}

	public PaginationBean<Ccategory> getAlltype(String currpage, String pageSize) {
		PaginationBean<Ccategory> categoryBean = new PaginationBean<Ccategory>();
		if(currpage!=null){
			categoryBean.setCurrPage(Integer.parseInt(currpage));
		}
		
		if(pageSize!=null){
			categoryBean.setPageSize(Integer.parseInt(pageSize));
		}
		return CcategoryMapper.getAlltype(categoryBean);
	}

	@Override
	public List<Ccategory> getParentType(int parentId) {
		return CcategoryMapper.getParentType(parentId);
	}

}
