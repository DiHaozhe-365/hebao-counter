package com.dihaozhe.hebaocounter.controller;


import com.dihaozhe.hebaocounter.dao.impl.AccountDaoImpl;
import com.dihaozhe.hebaocounter.dao.impl.AssetDaoImpl;
import com.dihaozhe.hebaocounter.entity.dto.Account;
import com.dihaozhe.hebaocounter.entity.dto.Asset;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@Slf4j
@WebServlet(name = "updateNickNameServlet", value = "/update-nick-name-servlet")
public class UpdateNickNameServlet extends HttpServlet {

    public void init() {}

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        // 获取用户表单信息
        String accountId = request.getParameter("id");
        String nickName = request.getParameter("nickName");
        if (accountId.equals("-")) {
            out.println("<script>alert('请登录使用此功能');window.location.href='views/account.jsp';</script>");
        }

        // 判断数据合法

        // 数据写入对象
        Account account = new Account();
        account.setNickName(nickName);
        account.setId(Integer.valueOf(accountId));
        // 设置用户 session
        HttpSession session = request.getSession(true);
        account = (Account) session.getAttribute("account");
        account.setNickName(nickName);
        session.setAttribute("account", account);

        // 请求修改账号接口
        AccountDaoImpl accountDao = new AccountDaoImpl();
        accountDao.updateNickName(account);
        out.println("<script>alert('修改成功');window.location.href='views/account.jsp';</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void destroy() {
    }
}
