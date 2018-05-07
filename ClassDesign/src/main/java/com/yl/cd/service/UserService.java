package com.yl.cd.service;

import com.yl.cd.entity.Cuser;
import com.yl.cd.entity.PaginationBean;

public interface UserService {

	PaginationBean<Cuser> listPartUser(String page, String rows,Cuser cuser);

	Cuser getUserMsgById(Integer cuid);

	boolean modifyUser(Cuser cuser);

	boolean archiveUser(Integer cuid);

	Cuser userLogin(Cuser cuser);

	Cuser findCuser(int i);

	boolean register(Cuser user);

	boolean modifyUserByUser(Cuser cuser);

	boolean updatePassword(Cuser user);

	Cuser findCuserByName(String name);

	Cuser findCuserAndAccount(Integer cuaid);

	void resetPassword(String username, String randPassword);

}
