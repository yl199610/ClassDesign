package com.yl.cd.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yl.cd.entity.Cbook;
import com.yl.cd.entity.Ccomments;
import com.yl.cd.entity.Cfavorites;
import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.mapper.BookMapper;
import com.yl.cd.mapper.ProductMapper;
import com.yl.cd.service.ProductService;

import redis.clients.jedis.Jedis;

@Service("productService")
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductMapper productMapper;
	
	@Autowired
	private BookMapper bookMapper;

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
	public Integer getAllCountProduct() {
		return productMapper.getAllCountProduct();
	}

	@Override
	public int getTotalPage() {
		return productMapper.getTotalPage();
	}

	@Override
	public PaginationBean<Cproduct> getProductByMan(String currpage, String pageSize) {
		PaginationBean<Cproduct> productBean = new PaginationBean<Cproduct>();
		if(currpage!=null){
			productBean.setCurrPage(Integer.parseInt(currpage));
		}
		if(pageSize!=null){
			productBean.setPageSize(Integer.parseInt(pageSize));
		}
		List<Cproduct> c = productMapper.getProductByMan(productBean);
		//获得total 和 totalPage
		productBean = productMapper.getProductPageByMan(productBean);
		int total = productBean.getTotal();
//		System.out.println("pageSize:==="+pageSize+"total:=="+total+"totalPage======="+(int) Math.ceil((double)total/Double.parseDouble(pageSize)));
		Integer totalPage = (int) Math.ceil((double)total/Double.parseDouble(pageSize));
		productBean.setCurrPage(Integer.parseInt(currpage));
		productBean.setTotal(total);
		productBean.setPageSize(Integer.parseInt(pageSize));
		productBean.setTotalPage(totalPage);
		productBean.setRows(c);
		return productBean;
	}

	@Override
	public boolean archiveProduct(Integer cuid) {
		return productMapper.archiveProduct(cuid);
	}

	@Override
	public Cproduct detailProduct(Integer ccid) {
		return productMapper.detailProduct(ccid);
	}

	@Override
	public boolean modifyProduct(Cproduct cproduct) {
		Integer cbcpid = cproduct.getCbcpid();
		Cbook cbook = bookMapper.detailBook(cbcpid);
		cproduct.setCproductname(cbook.getBookname());
		return productMapper.modifyProduct(cproduct);
	}

	@Override
	public Cbook getBookMsgByBid(Integer cbid) {
		return productMapper.getBookMsgByBid(cbid);
	}

	@Override
	public boolean addProduct(Cproduct cproduct) {
		return productMapper.addProduct(cproduct);
	}

	@Override
	public PaginationBean<Cproduct> getProductByCcid(String currpage, String pageSize, Cproduct cproduct) {
		PaginationBean<Cproduct> ccategoryListProduct = new PaginationBean<Cproduct>();
		Map<String, Object> map = new HashMap<String, Object>();
		if("".equals(currpage)||null==currpage){
			currpage=currpage.valueOf(1);
		}
		if("".equals(pageSize)||null==pageSize){
			pageSize=pageSize.valueOf(5);
		}
		String cproductname=cproduct.getCproductname();
		String ccid=String.valueOf(cproduct.getSpcaid());
		map.put("cproductname", cproductname);
		map.put("ccid", ccid);
		map.put("currPage", currpage);
		map.put("pageSize", pageSize);
		List<Cproduct> cc = productMapper.getProductByCcid(map);
		//获得total 和 totalPage
		ccategoryListProduct = productMapper.getTotalAndTotalProduct(map);
		ccategoryListProduct.setRows(cc);
		return ccategoryListProduct;
	}

	@Override
	public PaginationBean<Cproduct> getProductByProductName(String currpage, String pageSize, String cproductname) {
		PaginationBean<Cproduct> ccategoryListProduct = new PaginationBean<Cproduct>();
		Map<String, Object> map = new HashMap<String, Object>();
		if("".equals(currpage)||null==currpage){
			currpage=currpage.valueOf(1);
		}
		if("".equals(pageSize)||null==pageSize){
			pageSize=pageSize.valueOf(5);
		}
		map.put("cproductname", cproductname);
		map.put("currPage", currpage);
		map.put("pageSize", pageSize);
		List<Cproduct> cc = productMapper.getProductByNameProduct(map);
		//获得total 和 totalPage
		ccategoryListProduct = productMapper.getTotalAndTotalProductByname(map);
		ccategoryListProduct.setRows(cc);
		return ccategoryListProduct;
	}

	@Override
	public List<Cproduct> getTwoProduct() {
		return productMapper.getTwoProduct();
	}

	@Override
	public List<Cproduct> getProductRedis(String ip,Integer cfp) {
		List<Cproduct> productSetList = new ArrayList<Cproduct>();
		Cproduct c = productMapper.getAllFavProduct(cfp);
		try {
			setProductRedis(ip,cfp,c);
			Set<String> setList = getRedis(ip);
			Iterator<String> iterator = setList.iterator();
			while(iterator.hasNext()){
				Cproduct product = new Cproduct();
				String setArr = iterator.next();
				String productList[] = setArr.split("_");
				product.setCpid(Integer.parseInt(productList[0]));
				product.setCproductname(productList[1]);
				product.setCimage(productList[2]);
				product.setCnormalprice(productList[3]);
				product.setCwsscprice(productList[4]);
				productSetList.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return productSetList;
	}

	public Set<String>  getRedis(String ip) throws Exception{
		Jedis jedis=new Jedis();
		Set<String> set=jedis.zrevrange(ip, 0,2);  //从大到小的排序
		return set;
	}

	
	
	@Override
	public void setProductRedis(String ip, Integer fid, Cproduct product) throws Exception {
		Jedis jedis=new Jedis();
		double score=(double)new Date().getTime();
		jedis.zadd(ip, score, fid+"_"+product.getCproductname()+"_"+product.getCimage()+"_"+product.getCwsscprice()+"_"+product.getCnormalprice());
	}
	

}
