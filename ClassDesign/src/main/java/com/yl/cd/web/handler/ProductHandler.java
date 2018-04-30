package com.yl.cd.web.handler;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.yl.cd.entity.Cbook;
import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.service.ProductService;
import com.yl.cd.util.JsoupGetBook;
import com.yl.cd.util.ServletUtil;

@Controller
@RequestMapping("/cproduct")
@SessionAttributes("productList")
public class ProductHandler {
	@Autowired
	private ProductService productService;
	public final static String PRODUCTLIST="productList";
	public static List<Cproduct> productList = new ArrayList<Cproduct>();
	// 模糊分页查询
	@RequestMapping("/list")
	@ResponseBody
	public PaginationBean<Cproduct> getAllProduct(String page, String rows, Cproduct cproduct) {
		LogManager.getLogger().debug("请求ProductHandler处理getAllProduct......");
		PaginationBean<Cproduct> productPage = productService.getAllProduct(page, rows, cproduct);
		return productPage;
	}

	// 首页页面加载热卖图书
	@RequestMapping("/gethotproduct")
	@ResponseBody
	public List<Cproduct> getAllHotProduct() {
		LogManager.getLogger().debug("请求ProductHandler处理getAllHotProduct......");
		List<Cproduct> cproductList = productService.getAllHotProduct();
		return cproductList;
	}

	// 首页页面加载评论最多图书
	@RequestMapping("/getcomproduct")
	@ResponseBody
	public List<Cproduct> getAllCommProduct() {
		LogManager.getLogger().debug("请求ProductHandler处理getAllCommProduct......");
		List<Cproduct> cproductList = productService.getAllCommProduct();
		return cproductList;
	}

	// 首页页面加载收藏最多图书
	@RequestMapping("/getfavproduct")
	@ResponseBody
	public List<Cproduct> getAllFavProduct() {
		LogManager.getLogger().debug("请求ProductHandler处理getAllFavProduct......");
		List<Cproduct> cproductList = productService.getAllFavProduct();
		return cproductList;
	}

	// 首页页面加载获取图书总数
	@RequestMapping("/getcountproduct")
	@ResponseBody
	public Integer getAllCountProduct() {
		LogManager.getLogger().debug("请求ProductHandler处理getAllCountProduct......");
		Integer count = productService.getAllCountProduct();
		return count;
	}

	// 首页页面加载获取图书推荐分页
	@RequestMapping("/getproductbyman")
	@ResponseBody
	public PaginationBean<Cproduct> getProductByMan(HttpServletRequest request) {
		LogManager.getLogger().debug("请求ProductHandler处理getProductByMan......" + request.getParameter("pageNos"));
		String page = request.getParameter("pageNos");
		PaginationBean<Cproduct> cproductList = new PaginationBean<Cproduct>();
		if ("".equals(page) || page == null) {
			page = String.valueOf(cproductList.getCurrPage());
		}
		String rows = "2";
		cproductList = productService.getProductByMan(page, rows);
		return cproductList;
	}

	// 首页加载爬虫数据
	@RequestMapping("/getjsoupdata")
	@ResponseBody
	public List<Cproduct> getJsoupData() {
		LogManager.getLogger().debug("请求ProductHandler处理getJsoupData......");
		List<Cproduct> cproductList = JsoupGetBook.getTopMsg();
		return cproductList;
	}

	/**
	 * 删除产品
	 */
	@RequestMapping("/archive")
	@ResponseBody
	public boolean archiveProduct(@RequestParam(name = "cuid") Integer cuid) {
		LogManager.getLogger().debug("请求ProductHandler处理delete....\n" + cuid);
		return productService.archiveProduct(cuid);
	}

	// 获取详情
	@RequestMapping("/detail")
	@ResponseBody
	public Cproduct detailProduct(@RequestParam(name = "ccid") Integer ccid) {
		LogManager.getLogger().debug("请求ProductHandler处理detailProduct....\n" + ccid);
		return productService.detailProduct(ccid);
	}

	// 修改
	@RequestMapping("/modify")
	@ResponseBody
	public boolean modifyProduct(@RequestParam(name = "picData", required = false) MultipartFile picData,
			Cproduct cproduct) {
		LogManager.getLogger().debug("请求ProductHandler处理modify...." + cproduct);
		if (picData != null) {
			try {
				picData.transferTo(new File(ServletUtil.UPLOAD_DIR, picData.getOriginalFilename()));
				cproduct.setCimage("/" + ServletUtil.UPLOAD_DIR_NAME + "/" + picData.getOriginalFilename());// 图片上传
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return productService.modifyProduct(cproduct);
	}

	// 书籍的添加
	@RequestMapping("/add")
	@ResponseBody
	public boolean addProduct(Cproduct cproduct) {
		LogManager.getLogger().debug("请求ProductHandler处理add...." + cproduct);
		// 通过cbcpid获得书籍信息
		Integer cbid = cproduct.getCbcpid();
		Cbook cbook = productService.getBookMsgByBid(cbid);
		cproduct.setCimage(cbook.getCimage());
		cproduct.setCdescription(cbook.getCintroduce());
		cproduct.setCproductname(cbook.getBookname());
		System.out.println(cproduct);
		return productService.addProduct(cproduct);
	}

	// 右侧购物车添加
//	@RequestMapping("/saveProductModel")
//	@ResponseBody
//	public List<Cproduct> saveProductModel(Cproduct cproduct,ModelMap map) throws Exception {
//	public static List<Cproduct> productList = new ArrayList<Cproduct>();
//		List<Cproduct> productList = new ArrayList<Cproduct>();
//		LogManager.getLogger().debug("请求ProductHandler处理saveProductModel...." + cproduct);
//		if("".equals(cproduct.getCpfree())||"".equals(cproduct.getCproductname())||"".equals(cproduct.getCwsscprice())){
//			cproduct.setCpfree(null);
//			cproduct.setCproductname(null);
//			cproduct.setCwsscprice(null);
//		}
//		if(cproduct.getSpcaid()!=null&&null==cproduct.getCpfree()&&null==cproduct.getCproductname()&&null==cproduct.getCwsscprice()){
//			for (Cproduct cproduct1 : productList) {
//				if(cproduct.getSpcaid().equals(cproduct1.getSpcaid())){
//					productList.remove(cproduct1);
//					return productList;
//				}
//			}
//		}
//		System.out.println("====1231312321========"+cproduct);
//		//判断该对象是否: 返回ture表示所有属性为null  返回false表示不是所有属性都是null
//		if(isAllFieldNull(cproduct)){
//			return productList;
//		}
//		if (productList != null && cproduct!=null) {
//			for (int i = 0; i < productList.size(); i++) {
//				if(cproduct==null||"".equals(cproduct)){
//					return productList;
//				}
//				if(cproduct.getCproductname()==null||"".equals(cproduct.getCproductname())){
//					Collection nuCon = new Vector(); 
//					nuCon.add(null); 
//					productList.removeAll(nuCon);
//				}
//				if (productList.get(i).getCproductname().equals(cproduct.getCproductname()) || cproduct.getCproductname() == productList.get(i).getCproductname()) {
//					productList.get(i).setCpfree(String.valueOf(cproduct.getCpfree()));
//					productList.remove(productList.get(i));
//				}
//			}
//		}
//		if(cproduct!=null){
//			productList.add(cproduct);
//		}
//		map.put("productList",productList);//放到sessoin
//		return productList;
//	}
//	// 右侧购物车添加
	@RequestMapping("/saveProductModel")
	@ResponseBody
	public List<Cproduct> saveProductModel(Cproduct cproduct,ModelMap map) throws Exception {
		LogManager.getLogger().debug("请求ProductHandler处理saveProductModel...." + cproduct);
//		List<Cproduct> productList = new ArrayList<Cproduct>();
		if(cproduct.getCkeywords()!=null&&"".equals(cproduct.getCpfree())&&"".equals(cproduct.getCproductname())&&"".equals(cproduct.getCwsscprice())){
			cproduct.setCpfree(null);
			cproduct.setCproductname(null);
			cproduct.setCwsscprice(null);
			return productList;
		}
		if(cproduct.getSpcaid()!=null&&null==cproduct.getCpfree()&&null==cproduct.getCproductname()&&null==cproduct.getCwsscprice()){
			for (Cproduct cproduct1 : productList) {
				if(cproduct.getSpcaid().equals(cproduct1.getSpcaid())){
					productList.remove(cproduct1);
					return productList;
				}
			}
		}
		//判断该对象是否: 返回ture表示所有属性为null  返回false表示不是所有属性都是null
		if(isAllFieldNull(cproduct)){
			return productList;
		}
		if (productList != null && cproduct!=null) {
			for (int i = 0; i < productList.size(); i++) {
				if(cproduct==null||"".equals(cproduct)){
					return productList;
				}
				if(cproduct.getCproductname()==null||"".equals(cproduct.getCproductname())){
					Collection nuCon = new Vector(); 
					nuCon.add(null); 
					productList.removeAll(nuCon);
				}
				if (productList.get(i).getCproductname().equals(cproduct.getCproductname()) || cproduct.getCproductname() == productList.get(i).getCproductname()) {
					productList.get(i).setCpfree(String.valueOf(cproduct.getCpfree()));
					productList.remove(productList.get(i));
				}
			}
		}
		if(cproduct!=null){
			productList.add(cproduct);
		}
		map.put(PRODUCTLIST,productList);
		System.out.println(map.get(PRODUCTLIST));
		return productList;
	}
//	 购物车点击加减改变static的值
//	@RequestMapping("/changeProductModel")
//	@ResponseBody
//	public List<Cproduct> changeProductModel(Cproduct cproduct) throws Exception {
//		LogManager.getLogger().debug("请求ProductHandler处理changeProductModel...." + cproduct);
//		productList
//		return productList;
//	}
//	
	
    public static boolean isAllFieldNull(Object obj) throws Exception{
        Class stuCla = (Class) obj.getClass();// 得到类对象
        Field[] fs = stuCla.getDeclaredFields();//得到属性集合
        boolean flag = true;
        for (Field f : fs) {//遍历属性
            f.setAccessible(true); // 设置属性是可以访问的(私有的也可以)
            Object val = f.get(obj);// 得到此属性的值
            if(val!=null) {//只要有1个属性不为空,那么就不是所有的属性值都为空
                flag = false;
                break;
            }
        }
        return flag;
    }

}