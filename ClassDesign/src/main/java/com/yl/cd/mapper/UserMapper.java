package com.yl.cd.mapper;

import org.apache.ibatis.annotations.Param;

import com.yl.cd.entity.Cuser;
import com.yl.cd.entity.PaginationBean;

public interface UserMapper {

	PaginationBean<Cuser> getUsersByPagination(@Param("userBean")PaginationBean<Cuser> userBean,@Param("cuser")Cuser cuser);
}
