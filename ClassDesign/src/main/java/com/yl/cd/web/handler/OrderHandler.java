package com.yl.cd.web.handler;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yl.cd.entity.Cbook;
import com.yl.cd.entity.Corder;
import com.yl.cd.entity.Corderitem;
import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.service.AccountService;
import com.yl.cd.service.OrderService;

@Controller
@RequestMapping("/corder")
public class OrderHandler{
	@Autowired
	private OrderService orderService;
	@Autowired
	private AccountService accountService;	
	// 模糊分页查询
	@RequestMapping("/list")
	@ResponseBody
	public PaginationBean<Corder> getAllCorder(String page, String rows, Corder corder) {
		LogManager.getLogger().debug("请求OrderHandler处理getAllCorder......");
		PaginationBean<Corder> productPage = orderService.getAllCorder(page, rows, corder);
		return productPage;
	}
	
	//生成订单
	@RequestMapping("/add")
	@ResponseBody
	public boolean addOrder(Corder corder,HttpServletRequest request) {//用户id  订单时间  总价格   
		LogManager.getLogger().debug("请求OrderHandler处理add...." + corder);
		String num = request.getParameter("unum");
		String pricetotal = request.getParameter("pricetotal");
		String spid = request.getParameter("spid");//订单编号和数量的结合
		String proname = request.getParameter("proname");
		Date nowTime=new Date(); 
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String cordertime = sdf.format(nowTime);  
		corder.setCordertime(cordertime)	;
		corder.setCtotalprice(pricetotal);
		System.out.println("--------------"+corder);
		System.out.println(num+"=="+pricetotal+"=="+spid+"==="+proname);
		String []one =  spid.split(",");
		boolean flag = orderService.insertCorder(corder,num,pricetotal,spid);
		if(flag){
			boolean f = accountService.reduceMoney(pricetotal,proname);
			System.out.println(pricetotal+"扣除账户金额"+f);
			for (int j = 0;  j< one.length; j++) {
				String []two =  one[j].split("-");
				String pod = two[0];
			//删除productList的值
/*				for (Cproduct cproduct1 : ProductHandler.productList) {
					System.out.println(proname+"========="+pod+"==========="+cproduct1.getSpcaid()+"========="+cproduct1.getCkeywords());
					if(pod.equals(String.valueOf(cproduct1.getSpcaid()))&&proname.equals(cproduct1.getCkeywords())){
						System.out.println("购物车的数据被清空+++================="+cproduct1+"+++=================");
						ProductHandler.productList.remove(cproduct1);
					}
				}*/
				for (int i = 0; i < ProductHandler.productList.size(); i++) {
					if(pod.equals(String.valueOf(ProductHandler.productList.get(i).getSpcaid()))&&proname.equals(ProductHandler.productList.get(i).getCkeywords())){
						System.out.println("购物车的数据被清空+++================="+ProductHandler.productList.get(i)+"+++=================");
						ProductHandler.productList.remove(ProductHandler.productList.get(i));
					}
				}
			}

		}
		return flag;
	}
	
	
	// 模糊分页查询
	@RequestMapping("/findorderbyid")
	@ResponseBody
	public PaginationBean<Corder> getAllCorderByUser(HttpServletRequest request) {
		LogManager.getLogger().debug("请求OrderHandler处理getAllCorderByUser根据用户查出订单......");
		String page = request.getParameter("pageNos");
		PaginationBean<Cproduct> cproductList = new PaginationBean<Cproduct>();
		if ("".equals(page) || page == null) {
			page = String.valueOf(cproductList.getCurrPage());
		}
		String rows = "2";
		String cordid = request.getParameter("cordid");
		Corder corder = new Corder();
		corder.setCordid(Integer.parseInt(cordid));
		PaginationBean<Corder> productPage = orderService.getAllCorder(page, rows, corder);
		return productPage;
	}
	
	@RequestMapping("/findorderone")
	@ResponseBody
	public PaginationBean<Corder> findOrderOne(HttpServletRequest request) {
		LogManager.getLogger().debug("请求OrderHandler处理getAllCorderByUser根据用户查出一个订单......");
		String cordid = request.getParameter("cordid");
		String coid = request.getParameter("coid");
		Corder corder = new Corder();
		corder.setCordid(Integer.parseInt(cordid));
		corder.setCoid(Integer.parseInt(coid));
		PaginationBean<Corder> productPage = orderService.getAllCorder("1","10", corder);
		return productPage;
	}
	@RequestMapping("/cancelorder")
	@ResponseBody
	public boolean cancelOrder(String coid) {
		LogManager.getLogger().debug("请求OrderHandler处理cancelOrder取消订单......"+coid);
		return orderService.cancelOrder(coid);
	}
	
	@RequestMapping("/findorderdetail")
	@ResponseBody
	public List<Corderitem> findorderDetail(String corid) {
		LogManager.getLogger().debug("请求OrderHandler处理findorderDetail订单详情......"+corid);
		return orderService.findorderDetail(corid);
	}
}