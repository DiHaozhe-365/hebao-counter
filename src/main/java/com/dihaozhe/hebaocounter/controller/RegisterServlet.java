package com.dihaozhe.hebaocounter.controller;


import com.dihaozhe.hebaocounter.entity.dto.Account;
import com.dihaozhe.hebaocounter.service.impl.AccountServiceImpl;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import static com.dihaozhe.hebaocounter.config.Md5Config.md5Encrypt;

@Slf4j
@WebServlet(name = "registerServlet", value = "/register-servlet")
public class RegisterServlet extends HttpServlet {

    public void init() {}

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        boolean result;

        // 获取用户表单信息
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String nickName = request.getParameter("nick-name");

        // 判断数据合法

        // 数据写入对象
        Account account = new Account();
        account.setUsername(username);
        account.setNickName(nickName);
        // 密码加密
        account.setPassword(md5Encrypt(password));

        // 请求注册接口
        AccountServiceImpl accountService = new AccountServiceImpl();
        result = accountService.register(account);
        if (result) {
            out.println("<script>alert('注册成功');window.location.href='views/login.jsp';</script>");
        } else {
            out.println("<script>alert('账号已被占用');window.location.href='views/register.jsp';</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void destroy() {
    }
}
