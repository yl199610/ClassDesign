package com.yl.cd.mapper;

import java.util.List;
import java.util.Map;

import com.yl.cd.entity.Ccategory;
import com.yl.cd.entity.PaginationBean;

public interface CcategoryMapper {

	List<Ccategory> getAllOnetype(int parentid);

	List<Ccategory> getAllTwotype(int ccid);

	Ccategory getAllThreetype(int ccid);

	PaginationBean<Ccategory> getAlltype(PaginationBean<Ccategory> categoryBean);

	List<Ccategory> getParentType(int parentId);

	List<Ccategory> getCatgroyByName(Map<String, Object> map);

	PaginationBean<Ccategory> getTotalAndTotalPage(Map<String, Object> map);

	boolean archiveCategory(Integer ccid);

	boolean modifyCate(Ccategory ccatgory);

	Ccategory detailCategory(Integer ccid);

	Ccategory getTheFirstParentid();//获得总父类

	List<Ccategory> getAllParentTypeByCcid(String levels);

	List<Ccategory> getAllThridType();


}
