package com.yl.cd.service;

import java.util.List;

import com.yl.cd.entity.Ccategory;
import com.yl.cd.entity.PaginationBean;

public interface CcategoryService {

	List<Ccategory> getAllOnetype();

	List<Ccategory> getAllTwotype(int ccid);

//	List<Ccategory> getAllThreetype(int ccid);
	Ccategory getAllThreetype(int ccid);

	PaginationBean<Ccategory> getAlltype(String page, String rows);

	List<Ccategory> getParentType(int parentId);

	PaginationBean<Ccategory> getCatgroyByName(String page, String rows, Ccategory ccatgory);
}
