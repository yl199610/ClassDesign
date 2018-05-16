package com.yl.cd.web.handler;

import javax.servlet.http.HttpServletRequest;

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
	

	// 模糊分页查询
	@RequestMapping("/list")
	@ResponseBody
	public PaginationBean<Ccomments> getAllComments(String page, String rows, Ccomments comments) {
		LogManager.getLogger().debug("请求CommentHandler处理getAllComments......");
		PaginationBean<Ccomments> commentPage = commentService.getAllComments(page, rows, comments);
		return commentPage;
	}
	
	
	// 模糊分页查询
	@RequestMapping("/listbyuserid")
	@ResponseBody
	public PaginationBean<Ccomments> getCommentsByUid(HttpServletRequest request,Ccomments comments) {
		LogManager.getLogger().debug("请求CommentHandler处理getCommentsByUid......"+request.getParameter("pageNos"));
		String page = request.getParameter("pageNos");
		PaginationBean<Ccomments> ccategoryPageProduct = new PaginationBean<Ccomments>();
		if ("".equals(page) || page == null) {
			page = String.valueOf(ccategoryPageProduct.getCurrPage());
		}
		String rows = "100";
		ccategoryPageProduct = commentService.getCommentsByUid(page, rows,comments);
		return ccategoryPageProduct;
	}
	
	@RequestMapping("/getcommentsbyId")
	@ResponseBody
	public PaginationBean<Ccomments> getCommentsById(HttpServletRequest request) {
		String cfpTemp = request.getParameter("ccid");
		Integer cfp = Integer.parseInt(cfpTemp);
		LogManager.getLogger().debug(request.getParameter("pageNos")+"请求CommentHandler处理getCommentsById......"+cfp);
		String page = request.getParameter("pageNos");
		PaginationBean<Ccomments> commentsList = new PaginationBean<Ccomments>();
		if("".equals(page)||page==null){
			page=String.valueOf(commentsList.getCurrPage());
		}
		String rows = "5";
		commentsList = commentService.getCommentsById(cfp,page,rows);
		return commentsList;
	}
	
	@RequestMapping("/addcomment")
	@ResponseBody
	public boolean addComment(Ccomments comments) {
		LogManager.getLogger().debug("请求CommentHandler处理getCommentsById......"+comments);
		return commentService.addComment(comments);
	}
	
	
	
	//获得产品星级别
	@RequestMapping("/getproductstar")
	@ResponseBody
	public Ccomments getProductStar(String ccid ) {
		LogManager.getLogger().debug("请求ProductHandler处理getProductStar...."+ccid);
		Ccomments c =commentService.getProductStar(ccid);
		if(c==null){
			c=new Ccomments();
			c.setStar("0");
		}
		return c;
	}
	
	
	@RequestMapping("/delcomment")
	@ResponseBody
	public boolean cancelComment(String cid) {
		LogManager.getLogger().debug("请求ProductHandler处理删除评论......"+cid);
		return commentService.cancelComment(Integer.parseInt(cid));
	}
}
