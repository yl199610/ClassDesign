package com.yl.cd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yl.cd.entity.Account;
import com.yl.cd.entity.Cuser;
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

	@Override
	public Account findUserMoney(String cuid) {
		return acccountMapper.findAccountById(Integer.parseInt(cuid));
	}

	@Override
	public boolean reduceMoney(String pricetotal, String proname) {
		Cuser cuser = userMapper.findCuserByName(proname);
		Account account = acccountMapper.findAccountById(cuser.getCuid());
		account.setMoney(String.valueOf(Double.parseDouble(account.getMoney())-Double.parseDouble(pricetotal)));
		return acccountMapper.addMoney(account);
	}

}
