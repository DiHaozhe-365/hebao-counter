package com.dihaozhe.hebaocounter.dao;

import com.dihaozhe.hebaocounter.entity.dto.Account;

import java.util.List;

public interface AccountDao {

    // Create 增加账号
    void createAccount(Account account);

    // Read 查询账号
    Account readAccountById(int id);
    Account readAccountByUsername(Account account);
    Account readAccountByUsernameAndPassword(Account account);
    List<Account> readAccounts();

    // Update 更新账号
    void updateAccount(Account account);
    void updateNickName(Account account);

    // Delete 删除账号
    void deleteAccount(int id);
}
