package com.yl.cd.service;

import com.yl.cd.entity.Cuser;
import com.yl.cd.entity.PaginationBean;

public interface UserService {

	PaginationBean<Cuser> listPartUser(String page, String rows,Cuser cuser);

	Cuser getUserMsgById(Integer cuid);

	boolean modifyUser(Cuser cuser);

	boolean archiveUser(Integer cuid);

}
