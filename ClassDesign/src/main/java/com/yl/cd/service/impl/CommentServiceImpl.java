package com.yl.cd.service.impl;

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
	public PaginationBean<Ccomments> getAllComment(String currpage, String pageSize) {
		PaginationBean<Ccomments> commentBean = new PaginationBean<Ccomments>();
		if(currpage!=null){
			commentBean.setCurrPage(Integer.parseInt(currpage));
		}
		
		if(pageSize!=null){
			commentBean.setPageSize(Integer.parseInt(pageSize));
		}
		return commentMapper.getAllComment(commentBean);
	}

}
