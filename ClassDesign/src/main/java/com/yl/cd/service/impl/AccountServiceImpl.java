package com.yl.cd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yl.cd.entity.Account;
import com.yl.cd.mapper.AccountMapper;
import com.yl.cd.mapper.UserMapper;
import com.yl.cd.service.AccountService;
@Service("accountService")
public class AccountServiceImpl implements AccountService{
	@Autowired
	private AccountMapper acccountMapper;
	@Autowired
	private UserMapper userMapper;

	@Override
	public boolean addAccount(Account account) {
		boolean flag = acccountMapper.addAccount(account);
		return flag;
	}

	@Override
	public boolean editAccount(Account account) {
		boolean flag = acccountMapper.editAccount(account);
		return flag;
	}

	@Override
	public boolean addMoney(Account account) {
		Account a = acccountMapper.findAccountById(account.getCuaid());
		account.setMoney(String.valueOf(Double.parseDouble(a.getMoney())+Double.parseDouble(account.getMoney())));
		return acccountMapper.addMoney(account);
	}

}
