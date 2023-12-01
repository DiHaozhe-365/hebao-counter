package com.dihaozhe.hebaocounter.service;

import com.dihaozhe.hebaocounter.entity.dto.Account;

public interface AccountService {
    // 登录接口
    Account login(Account account);

    // 注册接口
    boolean register(Account account);
}
