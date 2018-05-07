package com.yl.cd.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yl.cd.entity.Ccomments;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.mapper.CommentMapper;
import com.yl.cd.service.CommentService;

@Service("commentService")
public class CommentServiceImpl implements CommentService{
	@Autowired
	private CommentMapper commentMapper;

	@Override
	public PaginationBean<Ccomments> getAllComments(String currpage, String pageSize, Ccomments comments) {
		PaginationBean<Ccomments> commentList = new PaginationBean<Ccomments>();
		Map<String, Object> map = new HashMap<String, Object>();
		if("".equals(currpage)||null==currpage){
			currpage=currpage.valueOf(1);
		}
		if("".equals(pageSize)||null==pageSize){
			pageSize=pageSize.valueOf(5);
		}
		Integer cuserid = comments.getCuserid();
		Integer cfp = comments.getCfp();
		map.put("cuserid", cuserid);
		map.put("cfp", cfp);
		map.put("currPage", currpage);
		map.put("pageSize", pageSize);
		List<Ccomments> c = commentMapper.getCommentByName(map);
		//获得total 和 totalPage
		commentList = commentMapper.getCommentTotalAndTotalPage(map);
		commentList.setRows(c);
		return commentList;
	}

	@Override
	public PaginationBean<Ccomments> getCommentsById(Integer cfp, String currpage, String pageSize) {
		PaginationBean<Ccomments> productBean = new PaginationBean<Ccomments>();
		Map<String, Object> map = new HashMap<String, Object>();
		if(currpage!=null){
			productBean.setCurrPage(Integer.parseInt(currpage));
		}
		if(pageSize!=null){
			productBean.setPageSize(Integer.parseInt(pageSize));
		}
		map.put("cfp", cfp);
		map.put("currPage", currpage);
		map.put("pageSize", pageSize);
		List<Ccomments> c = commentMapper.getAllDataComment(map);
		//获得total 和 totalPage
		productBean = commentMapper.getCommentPageAndPage(map);
		int total = productBean.getTotal();
		Integer totalPage = (int) Math.ceil((double)total/Double.parseDouble(pageSize));
		productBean.setCurrPage(Integer.parseInt(currpage));
		productBean.setTotal(total);
		productBean.setPageSize(Integer.parseInt(pageSize));
		productBean.setTotalPage(totalPage);
		productBean.setRows(c);
		return productBean;
	}

	@Override
	public boolean addComment(Ccomments comments) {
		return commentMapper.addComment(comments);
	}

	@Override
	public Ccomments getProductStar(String cfp) {
		return commentMapper.getProductStar(cfp);
	}

	@Override
	public PaginationBean<Ccomments> getCommentsByUid(String currpage, String pageSize, Ccomments comments) {
		PaginationBean<Ccomments> commentList = new PaginationBean<Ccomments>();
		Map<String, Object> map = new HashMap<String, Object>();
		if("".equals(currpage)||null==currpage){
			currpage=currpage.valueOf(1);
		}
		if("".equals(pageSize)||null==pageSize){
			pageSize=pageSize.valueOf(5);
		}
		Integer cuserid = comments.getCuserid();
		Integer cfp = comments.getCfp();
		map.put("cuserid", cuserid);
		map.put("cfp", cfp);
		map.put("currPage", currpage);
		map.put("pageSize", pageSize);
		List<Ccomments> c = commentMapper.getCommentByName(map);
		//获得total 和 totalPage
		commentList = commentMapper.getCommentTotalAndTotalPage(map);
		commentList.setRows(c);
		return commentList;
	}

	@Override
	public boolean cancelComment(int cid) {
		return commentMapper.cancelComment(cid);
	}

}
