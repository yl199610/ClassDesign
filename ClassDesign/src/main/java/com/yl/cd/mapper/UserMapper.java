package com.yl.cd.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.yl.cd.entity.Account;
import com.yl.cd.entity.Cuser;
import com.yl.cd.entity.PaginationBean;

public interface UserMapper {
	
	PaginationBean<Cuser> getUsersByPagination1(Map<String, Object> map);

	Cuser getUserMsgById(Integer cuid);

	boolean modifyUser(Cuser cuser);

	boolean archiveUser(Integer cuid);

	Cuser userLogin(Cuser cuser);

	Cuser findCuser(int cuid);

	boolean register(Cuser cuser);

	boolean modifyUserByUser(Cuser cuser);

	boolean updatePassword(Cuser cuser);


	Cuser findCuserByName(String name);

	Cuser findCuserAndAccount(Integer cuaid);
}
