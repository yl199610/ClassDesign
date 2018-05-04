package com.yl.cd.mapper;

import com.yl.cd.entity.Account;

public interface AccountMapper {

	boolean addAccount(Account account);

	boolean editAccount(Account account);

	Account findAccountById(Integer aid);

	boolean addMoney(Account account);


}
