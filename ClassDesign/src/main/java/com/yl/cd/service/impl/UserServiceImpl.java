package com.yl.cd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yl.cd.entity.Cuser;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.mapper.UserMapper;
import com.yl.cd.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;

	@Override
	public PaginationBean<Cuser> listPartUser(String currpage, String pageSize) {
		PaginationBean<Cuser> userBean = new PaginationBean<Cuser>();
		if(currpage!=null){
			userBean.setCurrPage(Integer.parseInt(currpage));
		}
		
		if(pageSize!=null){
			userBean.setPageSize(Integer.parseInt(pageSize));
		}
		return userMapper.getUsersByPagination(userBean);
	}
	

}
