package com.yl.cd.web.handler;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yl.cd.entity.Ccategory;
import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.service.CcategoryService;

@Controller
@RequestMapping("/ccategory")
public class CcategoryHandler {
	@Autowired
	private CcategoryService ccategoryService;

	/**
	 * 获得所有一级标题
	 */
	@RequestMapping("/firsttype")
	@ResponseBody
	public List<Ccategory> getAllOnetype() {
		LogManager.getLogger().debug("请求CcategoryHandler处理getAllOnetype......");
		return ccategoryService.getAllOnetype();
	}

	/**
	 * 获得所有二级标题
	 */
	@RequestMapping("/secondtype")
	@ResponseBody
	public List<Ccategory> getAllTwotype(@RequestParam(name = "ccid") int ccid) {
		LogManager.getLogger().debug("请求CcategoryHandler处理getAllTwotype......" + ccid);
		return ccategoryService.getAllTwotype(ccid);
	}

	/**
	 * 获得所有三级标题
	 */
	@RequestMapping("/thridtype")
	@ResponseBody
	public List<Ccategory> getAllThreetype(@RequestParam(name = "tccid") String ccid) {
		LogManager.getLogger().debug("请求CcategoryHandler处理getAllThreetype......" + ccid);
		Ccategory c = null;
		List<Ccategory> cate = new ArrayList<Ccategory>();
		String arr[] = ccid.split(",");
		int intArr[] = new int[arr.length];
		for (int i = 0; i < arr.length; i++) {
			intArr[i] = Integer.parseInt(arr[i]);
			c = ccategoryService.getAllThreetype(intArr[i]);
			cate.add(c);
		}
		return cate;
	}

	/**
	 * 获得所有标题 可能已经没有作用了
	 */
	@RequestMapping("/list")
	@ResponseBody
	public PaginationBean<Ccategory> getAlltype(String page, String rows) {
		LogManager.getLogger().debug("请求CcategoryHandler处理getAlltype......");
		PaginationBean<Ccategory> ccategoryPage = ccategoryService.getAlltype(page, rows);
		List<Ccategory> ccategoryList = ccategoryPage.getRows();
		if (ccategoryList.size() > 0) {
			for (Ccategory ccategory : ccategoryList) {
				int parentId = ccategory.getParentid();
				List<Ccategory> leavelList = ccategoryService.getParentType(parentId);
				if (leavelList.size() > 0) {
					for (Ccategory leavel : leavelList) {
						ccategory.setCafree(leavel.getLevels() + "(" + parentId + ")");
					}
				}
			}
		}
		return ccategoryPage;
	}

	// 模糊分页查询
	@RequestMapping("/listlevels")
	@ResponseBody
	public PaginationBean<Ccategory> getCatgroyByName(String page, String rows, Ccategory ccatgory) {
		LogManager.getLogger().debug("请求CcategoryHandler处理getCatgroyByName......");
		PaginationBean<Ccategory> ccategoryPage = ccategoryService.getCatgroyByName(page, rows, ccatgory);
		List<Ccategory> ccategoryList = ccategoryPage.getRows();
		if (ccategoryList.size() > 0) {
			for (Ccategory ccategory : ccategoryList) {
				int parentId = ccategory.getParentid();
				List<Ccategory> leavelList = ccategoryService.getParentType(parentId);
				if (leavelList.size() > 0) {
					for (Ccategory leavel : leavelList) {
						ccategory.setCafree(leavel.getLevels() + "(" + leavel.getCcname() + ")");
					}
				}
			}
		}
		return ccategoryPage;
	}

	/**
	 * 删除目录
	 */
	@RequestMapping("/archive")
	@ResponseBody
	public boolean archiveCategory(@RequestParam(name = "ccid") Integer ccid) {
		LogManager.getLogger().debug("请求CcategoryHandler处理archiveCategory....\n" + ccid);
		return ccategoryService.archiveCategory(ccid);
	}

	// 获取详情
	@RequestMapping("/detail")
	@ResponseBody
	public Ccategory detailCategory(@RequestParam(name = "ccid") Integer ccid) {
		LogManager.getLogger().debug("请求CcategoryHandler处理detailCategory....\n" + ccid);
		return ccategoryService.detailCategory(ccid);
	}

	// 修改
	@RequestMapping("/modify")
	@ResponseBody
	public boolean modifyCate(Ccategory ccatgory) {
		LogManager.getLogger().debug("请求CcategoryHandler处理modifyCate...." + ccatgory);
		return ccategoryService.modifyCate(ccatgory);
	}

	// 加载所有父目录标题
	@RequestMapping("/getallparentTypeByCcid")
	@ResponseBody
	public List<Ccategory> getAllParentTypeByCcid(@RequestParam(name = "ccid") int ccid) {
		LogManager.getLogger().debug("请求CcategoryHandler处理getAllParentTypeByCcid......" + ccid);
		return ccategoryService.getAllParentTypeByCcid(ccid);
	}

	// 加载所有三级目录
	@RequestMapping("/getallthridtype")
	@ResponseBody
	public List<Ccategory> getAllThridType() {
		LogManager.getLogger().debug("请求CcategoryHandler处理getAllThridType......");
		return ccategoryService.getAllThridType();
	}

	// 目录的添加 失去焦点获得父目录
	@RequestMapping("/lostFouns")
	@ResponseBody
	public List<Ccategory> addCcategoryGetParent(@RequestParam(name = "levels") String levels) {
		LogManager.getLogger().debug("请求CcategoryHandler处理addCcategoryGetParent...." + levels);
		return ccategoryService.getAllParentTypeByLevels(levels);
	}
	
	// 目录的添加
	@RequestMapping("/add")
	@ResponseBody
	public boolean addCcategory(Ccategory c) {
		LogManager.getLogger().debug("请求CcategoryHandler处理addCcategory...." + c);
		return ccategoryService.addCcategory(c);
	}

}