package com.yl.cd.mapper;

import com.yl.cd.entity.Ccomments;
import com.yl.cd.entity.PaginationBean;

public interface CommentMapper {

	PaginationBean<Ccomments> getAllComment(PaginationBean<Ccomments> commentBean);

}
