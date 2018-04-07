package com.yl.cd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yl.cd.entity.Cadmin;
import com.yl.cd.mapper.CadminMapper;
import com.yl.cd.service.CadminService;

@Service("cadminService")
public class CadminServiceImpl implements CadminService{
	@Autowired
	private CadminMapper cadminMapper;
	
	@Override
	public Cadmin adminLogin(Cadmin admin) {
		return cadminMapper.adminLogin(admin);
	}
}
