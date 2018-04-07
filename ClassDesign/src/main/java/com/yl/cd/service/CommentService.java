package com.yl.cd.service;

import com.yl.cd.entity.Ccomments;
import com.yl.cd.entity.PaginationBean;

public interface CommentService {

	PaginationBean<Ccomments> getAllComment(String page, String rows);

}
