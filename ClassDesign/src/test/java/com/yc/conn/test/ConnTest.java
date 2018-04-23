package com.yc.conn.test;

import static org.junit.Assert.assertNotNull;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yl.cd.entity.Cadmin;
import com.yl.cd.entity.Ccategory;
import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.Cuser;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.mapper.CadminMapper;
import com.yl.cd.mapper.CcategoryMapper;
import com.yl.cd.mapper.ProductMapper;
import com.yl.cd.mapper.UserMapper;
import com.yl.cd.service.impl.CcategoryServiceImpl;
import com.yl.cd.service.impl.ProductServiceImpl;

@RunWith(SpringJUnit4ClassRunner.class)
// @ContextConfiguration(locations={"classpath:spring.xml",
// "classpath:spring-mvc.xml"})

@ContextConfiguration("classpath:spring.xml")
public class ConnTest {
	@Autowired
	private DataSource dataSource;
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	@Autowired
	private CcategoryMapper ccategoryMapper;
	@Autowired
	private CadminMapper cadminMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private CcategoryServiceImpl categoryServiceImpl;
	@Autowired
	private ProductServiceImpl productServiceImpl;
	@Autowired
	private ProductMapper productMapper;
	
	@Test
	public void testCateAll(){
		Ccategory c = new Ccategory(1,"一级目录","",null,1,null,null);
		PaginationBean<Ccategory> caca = categoryServiceImpl.getCatgroyByName(String.valueOf(1),String.valueOf(5),c);
		System.out.println(caca.toString()+"============"+caca.getCurrPage()+"============"+caca.getPageSize()+"============"+caca.getTotal()+"============"+caca.getTotalPage());
	}
	@Test
	public void testConn() throws SQLException {
		System.out.println("------------");
		Connection con = dataSource.getConnection();
		assertNotNull(con);
	}



	@Test
	public void testCate1() {
		Ccategory c =null;
		List<Ccategory> cate=new ArrayList<Ccategory>();
		String arr[]={"8","9","62"};
		int intArr[]=new int[arr.length];
		for (int i = 0; i < arr.length; i++) {
			intArr[i]=Integer.parseInt(arr[i]);
			c= ccategoryMapper.getAllThreetype(intArr[i]);
			cate.add(c);
		}
		System.out.println(cate);
	}
	@Ignore
	public void testAdminLogin() {
		Cadmin admin=new Cadmin(1,"a","a","1");
		admin = cadminMapper.adminLogin(admin);
		System.out.println(admin);
	}
	
	//产品信息
	@Test
	public void getAllHotProductTest() {
		System.out.println(productMapper.getAllHotProduct());
//		System.out.println("-----------------------");
//		System.out.println(productServiceImpl.getAllCommProduct());
//		System.out.println("-----------------------");
//		System.out.println("-==0=-0=-0=-0=-0=-0=-"+productServiceImpl.getAllFavProduct());
//		System.out.println("-----------------------");
//		System.out.println(productMapper.getProductByMan());
//		System.out.println("-----------------------");
//		System.out.println(productMapper.getAllCountProduct());
//		System.out.println("-----------------------");
	}
	@Test
	public void getProductTestPage() {
		PaginationBean<Cproduct>  p = productServiceImpl.getProductByMan("1","8");
		System.out.println(p.getTotal()+"========"+p.getTotalPage());
	}
	
	
}
