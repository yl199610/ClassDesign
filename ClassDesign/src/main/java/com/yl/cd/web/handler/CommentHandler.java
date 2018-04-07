package com.yl.cd.web.handler;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yl.cd.entity.Ccomments;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.service.CommentService;

@Controller
@RequestMapping("/ccomments")
public class CommentHandler{
	@Autowired
	private CommentService commentService;
	

	/**
	 * 获得所有标题
	 */
	@RequestMapping("/list")
	@ResponseBody
	public PaginationBean<Ccomments> getAllComment(String page,String rows){
		LogManager.getLogger().debug("请求CommentHandler处理getAllComment......");
		return commentService.getAllComment(page,rows);
	}
	
}