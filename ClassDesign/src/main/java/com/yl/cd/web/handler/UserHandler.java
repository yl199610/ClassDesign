package com.yl.cd.web.handler;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.yl.cd.entity.Cuser;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.service.UserService;
import com.yl.cd.util.ServletUtil;

@Controller
@RequestMapping("/cuser")
@SessionAttributes("loginUser")
public class UserHandler{
	@Autowired
	private UserService userService;
	@Autowired
	private JavaMailSender mailSender;	

	/**
	 * 分页显示用户信息
	 */
	@RequestMapping("/userlist")
	@ResponseBody
	public PaginationBean<Cuser> userList(String page,String rows,Cuser cuser){
		LogManager.getLogger().debug("请求UserHandler处理list...."+page+"----"+rows+"====="+cuser);
		return userService.listPartUser(page,rows,cuser);
	}
	//获取用户对应信息
	@RequestMapping("/detail")
	@ResponseBody
	public Cuser userDetail(@RequestParam(name="sid")Integer cuid){
		LogManager.getLogger().debug("请求UserHandler处理userDetail...."+cuid);
		return userService.getUserMsgById(cuid);
	}
	
	//注册时候查询用户是否存在
	@RequestMapping("/check")
	@ResponseBody
	public boolean check(@RequestParam(name="uname",required=false)String name) {
		LogManager.getLogger().debug("请求userHandler查询用户名是否重复..."+name);
		if(name==""||"".equals(name)){//不通过
			return true;
		}else{
			Cuser user=userService.findCuserByName(name);
			if(user!=null){//查询出有这个用户名
				return false;
			}else{
				return true;
			}
		}
	}
	
	//获取用户信息
	@RequestMapping("/showuser")
	@ResponseBody
	public Cuser getUserMsgByName(String cuid) {
		LogManager.getLogger().debug("请求userHandler请求getUserMsgByName查询用户信息..-"+cuid+"--");
		Cuser user=userService.findCuser(Integer.parseInt(cuid));
		return user;
	}
	
	@RequestMapping("/modify")	
	@ResponseBody
	public boolean modify(@RequestParam(name="picData",required=false)MultipartFile picData,Cuser cuser){
		LogManager.getLogger().debug("请求userHandler处理modify...."+cuser);
		
		if(picData!=null){
			try {
				picData.transferTo(new File(ServletUtil.UPLOAD_DIR,picData.getOriginalFilename()));
				cuser.setCphoto("/"+ServletUtil.UPLOAD_DIR_NAME+"/"+picData.getOriginalFilename());//图片上传
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return userService.modifyUser(cuser);
	}
	
	@RequestMapping("/usermodify")
	@ResponseBody
	public boolean usermodify(@RequestParam(name="picData",required=false)MultipartFile picData,Cuser cuser){
		LogManager.getLogger().debug(picData+"用户发送请求userHandler处理usermodify...."+cuser);
		if(picData!=null){
			try {
				picData.transferTo(new File(ServletUtil.UPLOAD_DIR,picData.getOriginalFilename()));
				cuser.setCphoto("/"+ServletUtil.UPLOAD_DIR_NAME+"/"+picData.getOriginalFilename());//图片上传
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		return userService.modifyUserByUser(cuser);
	}
	
	
	/**
	 * 删除用户
	 */
	@RequestMapping("/archive")
	@ResponseBody
	public boolean archiveUser(@RequestParam(name="cuid")Integer cuid){
		LogManager.getLogger().debug("请求userHandler处理delete....\n"+cuid);
		return userService.archiveUser(cuid);
	}
	
	/**
	 * 用户登录
	 */
	@RequestMapping("/login")
	public String userLogin(HttpServletRequest request,ModelMap map){
		Cuser cuser=new Cuser();
		String username = request.getParameter("cusernamelogin");
		String password = request.getParameter("cpasswordlogin");
		cuser.setCusername(username);
		cuser.setCpassword(password);
		LogManager.getLogger().debug("请求CadminHandler处理adminLogin......"+cuser);
		cuser=userService.userLogin(cuser);
		if(cuser!=null){
			map.put("loginUser",cuser);//放到sessoin
			System.out.println(map.get("loginUser"));
			return "redirect:/index.jsp";
		}
		map.addAttribute("errorMsg","用户名或密码错误");
		return "forward:/login.jsp";
	}	
	
	//退出登录
	@RequestMapping("/logout")
	@ResponseBody
	public boolean logout(ModelMap map) {
		LogManager.getLogger().debug("请求userHandler退出登录...");
		Cuser cuser =new Cuser();
		map.put("loginUser",cuser);
		return true;
	}
	
	//注册
	@RequestMapping("/register")
	@ResponseBody
	public boolean register(Cuser user) {//ModelMap   逻辑操作和实体类    request.setAttribute
		LogManager.getLogger().debug("请求userHandler注册用户..."+user);
		if(userService.register(user)){
			return true;
		}else {
			return false;
		}
	}
	//修改密码
	@RequestMapping("/updatepassword")
	@ResponseBody
	public boolean updatePassword(Cuser user,ModelMap map) {//ModelMap   逻辑操作和实体类    request.setAttribute
		LogManager.getLogger().debug("请求userHandler修改密码..."+user);
		boolean flag = userService.updatePassword(user);
		return flag;
	}
	
	
	
	
	/**
	 * 忘记密码
	 */
	@RequestMapping("/forget")
	public String forget(String cusername, String cemail, HttpServletRequest request) {
		LogManager.getLogger().debug("请求UserHandler进行forget的操作....");
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom("studymail_test@163.com");
			helper.setTo(cemail);
			helper.setSubject("找回密码");
			String hrefStr = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getServletContext().getContextPath() + "/cuser/getpassword?username=" + cusername;
			System.out.println(hrefStr);
			helper.setText("<a href='" + hrefStr + "'>找回密码</a><br>如果连接不可用拷贝" + hrefStr + "到地址栏...", true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
			return "redirect:/page/forgetPassword.jsp";
		}
		return "redirect:/page/forgetSuccess.jsp";
	}
	@RequestMapping("/getpassword")
	public String getpassword(String username, HttpSession session) {
		Random rand = new Random();
		String randPassword = rand.nextInt(900000) + 100000 + "";
		//业务处理重置密码
		userService.resetPassword(username,randPassword);
		session.setAttribute("newPassword", randPassword);
		return "redirect:/page/getpasswordSuccess.jsp";
	}
	
	
}