package com.dihaozhe.hebaocounter.service.impl;

import com.dihaozhe.hebaocounter.dao.impl.AccountDaoImpl;
import com.dihaozhe.hebaocounter.entity.dto.Account;
import com.dihaozhe.hebaocounter.service.AccountService;

public class AccountServiceImpl implements AccountService {

    Account account;
    AccountDaoImpl accountDao;

    @Override
    public Account login(Account account) {
        this.account = new Account();
        this.accountDao = new AccountDaoImpl();
        // 去数据库查询是否存在该账号
        this.account = accountDao.readAccountByUsernameAndPassword(account);
        if (this.account != null) {
            return this.account;
        } else {
            return null;
        }
    }

    @Override
    public boolean register(Account account) {
        this.account = account;
        this.accountDao = new AccountDaoImpl();
        // 1.判断账号是否重复，若重复，则返回false
        if (accountDao.readAccountByUsername(account)!=null) {
            return false;
        }
        // 2.将账号写入数据库
        accountDao.createAccount(account);
        return true;
    }
}
