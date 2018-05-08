package com.yl.cd.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yl.cd.entity.Cuser;
import com.yl.cd.entity.PaginationBean;
import com.yl.cd.mapper.UserMapper;
import com.yl.cd.service.UserService;
import com.yl.cd.util.Encrypt;

@Service("userService")
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;

	@Override
	public PaginationBean<Cuser> listPartUser(String currpage, String pageSize,Cuser cuser) {
		Map<String, Object> map = new HashMap<String, Object>();
		if("".equals(currpage)||null==currpage){
			currpage=currpage.valueOf(1);
		}
		if("".equals(pageSize)||null==pageSize){
			pageSize=pageSize.valueOf(5);
		}
		String cusername=cuser.getCusername();
		Integer cuid=cuser.getCuid();
		map.put("cusername", cusername);
		map.put("cuid", cuid);
		map.put("currPage", currpage);
		map.put("pageSize", pageSize);
		return userMapper.getUsersByPagination1(map);
	}

	@Override
	public Cuser getUserMsgById(Integer cuid) {
		return userMapper.getUserMsgById(cuid);
	}

	@Override
	public boolean modifyUser(Cuser cuser) {
		return userMapper.modifyUser(cuser);
	}

	@Override
	public boolean archiveUser(Integer cuid) {
		return userMapper.archiveUser(cuid);
	}

	@Override
	public Cuser userLogin(Cuser cuser) {
		cuser.setCpassword(Encrypt.md5(cuser.getCpassword()));
		return userMapper.userLogin(cuser);
	}

	@Override
	public Cuser findCuser(int cuid) {
		return userMapper.findCuser(cuid);
	}

	@Override
	public boolean register(Cuser cuser) {
		cuser.setCpassword(Encrypt.md5(cuser.getCpassword()));
		return userMapper.register(cuser);
	}

	@Override
	public boolean modifyUserByUser(Cuser cuser) {
		return userMapper.modifyUserByUser(cuser);
	}

	@Override
	public boolean updatePassword(Cuser user) {
		user.setCpassword(Encrypt.md5(user.getCpassword()));
		return userMapper.updatePassword(user);
	}

	@Override
	public Cuser findCuserByName(String name) {
		return userMapper.findCuserByName(name);
	}

	@Override
	public Cuser findCuserAndAccount(Integer cuaid) {
		return userMapper.findCuserAndAccount(cuaid);
	}
	
	@Override
	public void resetPassword(String cusername, String cpassword) {
		Cuser user=new Cuser(cusername,Encrypt.md5(cpassword));
		userMapper.updatePassword(user);
	}

}
