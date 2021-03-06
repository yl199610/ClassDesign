package com.yl.cd.service;

import com.yl.cd.entity.Ccomments;
import com.yl.cd.entity.PaginationBean;

public interface CommentService {

	PaginationBean<Ccomments> getAllComments(String page, String rows, Ccomments comments);

	PaginationBean<Ccomments> getCommentsById(Integer cfp, String page, String rows);

	boolean addComment(Ccomments comments);

	Ccomments getProductStar(String ccid);

	PaginationBean<Ccomments> getCommentsByUid(String page, String rows, Ccomments comments);

	boolean cancelComment(int cid);

}
