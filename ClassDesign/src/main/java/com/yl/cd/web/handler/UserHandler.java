package com.yl.cd.web.handler;

import java.io.File;
import java.io.IOException;

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
			Cuser user=userService.findCuser(name);
			if(user!=null){//查询出有这个用户名
				return false;
			}else{
				return true;
			}
		}
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
	
	//注册
	@RequestMapping("/register")
	@ResponseBody
	public boolean register(Cuser user) {//ModelMap   逻辑操作和实体类    request.setAttribute
		LogManager.getLogger().debug("请求userHandler注册用户..."+user);
		return false;
		
//		if(userService.register(user)){
//			return true;
//		}else {
//			return false;
//		}
	}
	
	
}