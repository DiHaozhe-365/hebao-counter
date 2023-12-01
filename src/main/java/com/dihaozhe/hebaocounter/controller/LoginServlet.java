package com.dihaozhe.hebaocounter.controller;


import com.dihaozhe.hebaocounter.entity.dto.Account;
import com.dihaozhe.hebaocounter.service.impl.AccountServiceImpl;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

import static com.dihaozhe.hebaocounter.config.Md5Config.md5Encrypt;

@Slf4j
@WebServlet(name = "loginServlet", value = "/login-servlet")
public class LoginServlet extends HttpServlet {

    public void init() {}

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        // 获取用户表单信息
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 数据写入对象
        Account account = new Account();
        account.setUsername(username);
        account.setEmail(username);

        // 密码加密
        account.setPassword(md5Encrypt(password));

        // 请求登录接口
        AccountServiceImpl accountService = new AccountServiceImpl();
        account = accountService.login(account);
        if (account == null) {
            out.println("<script>alert('账号或密码错误');window.location.href='views/login.jsp';</script>");
        } else {
            // 设置用户 session
            HttpSession session = request.getSession(true);
            session.setAttribute("account",account);
            out.println("<script>alert('👏🏻欢迎，" + account.getNickName() + "');window.location.href='views/home.jsp';</script>");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void destroy() {
    }
}
