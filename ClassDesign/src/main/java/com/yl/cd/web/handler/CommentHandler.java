package com.yl.cd.web.handler;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yl.cd.entity.Ccomments;
import com.yl.cd.entity.Cfavorites;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.service.CommentService;

@Controller
@RequestMapping("/ccomments")
public class CommentHandler{
	@Autowired
	private CommentService commentService;
	

	// 模糊分页查询
	@RequestMapping("/list")
	@ResponseBody
	public PaginationBean<Ccomments> getAllComments(String page, String rows, Ccomments comments) {
		LogManager.getLogger().debug("请求CommentHandler处理getAllComments......");
		PaginationBean<Ccomments> commentPage = commentService.getAllComments(page, rows, comments);
		return commentPage;
	}
}
