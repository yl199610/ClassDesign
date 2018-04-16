package com.yl.cd.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public PaginationBean<Ccategory> getCatgroyByName(String currpage, String pageSize, Ccategory ccatgory) {
		PaginationBean<Ccategory> ccategoryList = new PaginationBean<Ccategory>();
		Map<String, Object> map = new HashMap<String, Object>();
		if("".equals(currpage)||null==currpage){
			currpage=currpage.valueOf(1);
		}
		if("".equals(pageSize)||null==pageSize){
			pageSize=pageSize.valueOf(5);
		}
		String levels=ccatgory.getLevels();
		String ccname=ccatgory.getCcname();
		map.put("levels", levels);
		map.put("ccname", ccname);
		map.put("currPage", currpage);
		map.put("pageSize", pageSize);
		List<Ccategory> c = CcategoryMapper.getCatgroyByName(map);
		//获得total 和 totalPage
		ccategoryList = CcategoryMapper.getTotalAndTotalPage(map);
		ccategoryList.setRows(c);
		return ccategoryList;
	}

	@Override
	public boolean archiveCategory(Integer ccid) {
		return CcategoryMapper.archiveCategory(ccid);
	}

	@Override
	public boolean modifyCate(Ccategory ccatgory) {
		return CcategoryMapper.modifyCate(ccatgory);
	}

}
