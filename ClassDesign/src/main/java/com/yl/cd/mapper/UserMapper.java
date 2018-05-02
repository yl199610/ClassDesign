package com.yl.cd.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.yl.cd.entity.Cuser;
import com.yl.cd.entity.PaginationBean;

public interface UserMapper {
	
	PaginationBean<Cuser> getUsersByPagination1(Map<String, Object> map);

	Cuser getUserMsgById(Integer cuid);

	boolean modifyUser(Cuser cuser);

	boolean archiveUser(Integer cuid);

	Cuser userLogin(Cuser cuser);

	Cuser findCuser(String name);

	boolean register(Cuser cuser);
}
