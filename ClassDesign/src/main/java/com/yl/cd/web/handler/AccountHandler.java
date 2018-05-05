package com.yl.cd.web.handler;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.logging.log4j.LogManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yl.cd.entity.Account;
import com.yl.cd.entity.Cuser;
import com.yl.cd.service.AccountService;
import com.yl.cd.service.UserService;

@Controller
@RequestMapping("/account")
public class AccountHandler {
	@Autowired
	private AccountService accountService;
	@Autowired
	private UserService userService;

	// 添加
	@RequestMapping("/addacount")
	@ResponseBody
	public boolean addAccount(Account account) {
		LogManager.getLogger().debug("请求AccountHandler添加用户账户..." + account);
		Cuser cuser = userService.findCuserAndAccount(account.getCuaid());
		if (cuser == null) {
			Date nowTime = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String datetime = sdf.format(nowTime);
			account.setDatetime(datetime);
			account.setMoney("0");
			return accountService.addAccount(account);
		} else {
			return false;
		}
	}

	// 添加
	@RequestMapping("/findapplyno")
	@ResponseBody
	public Cuser addAccount(String cuaid) {
		LogManager.getLogger().debug("请求AccountHandler查询用户和账户信息..." + cuaid);
		int cuaid1 = Integer.parseInt(cuaid);
		Cuser cuser = userService.findCuserAndAccount(cuaid1);
		return cuser;
	}

	@RequestMapping("/editacount")
	@ResponseBody
	public boolean editAccount(Account account) {
		LogManager.getLogger().debug("请求AccountHandler编辑用户账户..." + account);
		return accountService.editAccount(account);

	}
	
	
	@RequestMapping("/addmoney")
	@ResponseBody
	public boolean addmoney(Account account) {
		LogManager.getLogger().debug("请求AccountHandler账户充值..." + account);
		return accountService.addMoney(account);

	}
	
	@RequestMapping("/findaccountbyId")
	@ResponseBody
	public Account findAccountById(String cuid) {
		LogManager.getLogger().debug("请求AccountHandler查询用户余额..." + cuid);
		return accountService.findUserMoney(cuid);

	}
	

}