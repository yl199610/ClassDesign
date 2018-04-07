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
import com.yl.cd.mapper.CadminMapper;
import com.yl.cd.mapper.CcategoryMapper;

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

	@Ignore
	public void testConn() throws SQLException {
		Connection con = dataSource.getConnection();
		assertNotNull(con);
	}

	@Ignore
	public void testCate() {
		List<Ccategory> c = ccategoryMapper.getAllOnetype();
		System.out.println(c);
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
	
	
}
