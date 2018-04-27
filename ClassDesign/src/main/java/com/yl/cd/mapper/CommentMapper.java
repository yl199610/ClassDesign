package com.yl.cd.mapper;

import java.util.List;
import java.util.Map;

import com.yl.cd.entity.Ccomments;
import com.yl.cd.entity.PaginationBean;

public interface CommentMapper {

	List<Ccomments> getCommentByName(Map<String, Object> map);

	PaginationBean<Ccomments> getCommentTotalAndTotalPage(Map<String, Object> map);

	List<Ccomments> getAllDataComment(Map<String, Object> map);

	PaginationBean<Ccomments> getCommentPageAndPage(Map<String, Object> map);

}
