package com.yl.cd.service;

import com.yl.cd.entity.Cuser;
import com.yl.cd.entity.PaginationBean;

public interface UserService {

	PaginationBean<Cuser> listPartUser(String page, String rows,Cuser cuser);

}
