package com.yc.conn.test;

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
import com.yl.cd.entity.Cbook;
import com.yl.cd.entity.Ccategory;
import com.yl.cd.entity.Cproduct;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.mapper.BookMapper;
import com.yl.cd.mapper.CadminMapper;
import com.yl.cd.mapper.CcategoryMapper;
import com.yl.cd.mapper.ProductMapper;
import com.yl.cd.mapper.UserMapper;
import com.yl.cd.service.impl.BookServiceImpl;
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
	@Autowired
	private BookServiceImpl bookServiceImpl;
	@Autowired
	private BookMapper bookMapper;
	
	@Test
	public void testCateAll(){
		Ccategory c = new Ccategory(1,"一级目录","",null,1,null,null);
		PaginationBean<Ccategory> caca = categoryServiceImpl.getCatgroyByName(String.valueOf(1),String.valueOf(5),c);
		System.out.println(caca.toString()+"============"+caca.getCurrPage()+"============"+caca.getPageSize()+"============"+caca.getTotal()+"============"+caca.getTotalPage());
	}
	@Test
	public void testConn() throws SQLException {
		System.out.println("------------");
//		Date nowTime=new Date(); 
//		System.out.println(nowTime); 
//		SimpleDateFormat time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
//		System.out.println(time.format(nowTime)); 
/*		Connection con = dataSource.getConnection();
		assertNotNull(con);*/
		String spid = "7-3,3-4,";
		String []one =  spid.split(",");
		for (int i = 0; i < one.length; i++) {
			String []two =  one[i].split("-");//编号   数量
			System.out.println(two[0]+"===="+two[1]);
		}
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
		PaginationBean<Cproduct>  p = productServiceImpl.getProductByMan("2","3");
		System.out.println(p+"=-=--===-="+p.getTotal()+"========"+p.getTotalPage());
	}
	@Test
	public void getProduct() {
		Cproduct  p = productServiceImpl.detailProduct(48);
		System.out.println(p);
	}
	@Test
	public void getAllBook() {
		List<Cbook>  p = bookServiceImpl.getAllBookNoPage();
		System.out.println(p);
	}
	@Test
	public void getAllOneBook() {
		System.out.println(bookMapper.detailBook(11));
	}
	
	@Test
	public void getProductById() {
		System.out.println(productServiceImpl.getProductByCcid("1","2","21"));
	}
	
	
	
//	
//	@Test
//	public void sendMobileCode() {
//	    String rusult = null;
//	    // 官网的URL
//	    String url = "http://gw.api.taobao.com/router/rest";
//	    // 成为开发者，创建应用后系统自动生成
//	    String appkey = "23566780";
//	    String secret = "自己的App Secret";
//	    String code = "520";
//	    String product = "cool_moon";
//	    TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
//	    AlibabaAliqinFcSmsNumSendRequest req = new AlibabaAliqinFcSmsNumSendRequest();
//	    req.setExtend("1234");
//	    req.setSmsType("normal");
//	    req.setSmsFreeSignName("验证提醒");
//	    req.setSmsParamString("{\"code\":\""+code+"\",\"product\":\""+product+"\"}");
//	    req.setRecNum("自己的手机号码");
//	    req.setSmsTemplateCode("SMS_34530098");
//	    try {
//	        AlibabaAliqinFcSmsNumSendResponse rsp = client.execute(req);
//	        System.out.println(rsp.getBody());  
//	        rusult = rsp.getSubMsg();
//	    } catch (Exception e) {
//	        e.printStackTrace();
//	    }
//	    System.out.println(rusult);
//	}
//	
	
}
