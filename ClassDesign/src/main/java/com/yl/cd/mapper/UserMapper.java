package com.yl.cd.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yl.cd.entity.Cuser;
import com.yl.cd.entity.PaginationBean;

public interface UserMapper {

	PaginationBean<Cuser> getUsersByPagination(PaginationBean<Cuser> userBean,Cuser cuser);

	List<Cuser> getUsersByOther(@Param("userBean")PaginationBean<Cuser> userBean,@Param("cuser")Cuser cuser);
}
