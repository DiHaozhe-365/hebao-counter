package com.dihaozhe.hebaocounter.controller;

import com.dihaozhe.hebaocounter.dao.impl.BillDaoImpl;
import com.dihaozhe.hebaocounter.entity.dto.Bill;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Slf4j
@WebServlet(name = "createBillServlet", value = "/create-bill-servlet")
public class CreateBillServlet extends HttpServlet {
    public void init() {}

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        // 获取用户表单信息
        String accountId = request.getParameter("accountId");
        String assetId = request.getParameter("assetId");
        String billType = request.getParameter("billType");
        String billClass = request.getParameter("billClass");
        String description = request.getParameter("description");
        String money = request.getParameter("money");
        String time = request.getParameter("time");

        // 判断数据合法

        // 数据写入对象
        Bill bill = new Bill();
        bill.setAccountId(Integer.valueOf(accountId));
        bill.setAssetId(Integer.valueOf(assetId));
        bill.setBillType(billType);
        bill.setBillClass(billClass);
        bill.setDescription(description);
        bill.setMoney(Double.valueOf(money));
        bill.setTime(time);

        log.info(String.valueOf(bill));

        // 请求创建账单接口
        BillDaoImpl billDao = new BillDaoImpl();
        billDao.createBill(bill);
        out.println("<script>window.location.replace(document.referrer)</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void destroy() {
    }
}
