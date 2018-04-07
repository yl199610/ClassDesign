package com.yl.cd.mapper;

import com.yl.cd.entity.Cuser;
import com.yl.cd.entity.PaginationBean;

public interface UserMapper {

	PaginationBean<Cuser> getUsersByPagination(PaginationBean<Cuser> userBean);

}
