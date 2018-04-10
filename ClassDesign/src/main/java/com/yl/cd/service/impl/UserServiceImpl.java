package com.yl.cd.service.impl;

import java.util.List;

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
	public PaginationBean<Cuser> listPartUser(String currpage, String pageSize,Cuser cuser) {
		PaginationBean<Cuser> userBean = new PaginationBean<Cuser>();
		if(currpage!=null){
			userBean.setCurrPage(Integer.parseInt(currpage));
		}
		
		if(pageSize!=null){
			userBean.setPageSize(Integer.parseInt(pageSize));
		}
		List<Cuser> cuser1 = userMapper.getUsersByOther(userBean,cuser);
		userBean.setRows(cuser1);
		return userBean;
	}
	

}
