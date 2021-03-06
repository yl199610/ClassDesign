package com.yl.cd.service;

import com.yl.cd.entity.Account;

public interface AccountService {

	boolean addAccount(Account account);

	boolean editAccount(Account account);

	boolean addMoney(Account account);

	Account findUserMoney(String cuid);

	boolean reduceMoney(String pricetotal, String proname);

}
