package com.dihaozhe.hebaocounter.controller;

import com.alibaba.fastjson.JSONObject;
import com.dihaozhe.hebaocounter.dao.impl.AssetDaoImpl;
import com.dihaozhe.hebaocounter.dao.impl.BillDaoImpl;
import com.dihaozhe.hebaocounter.entity.dto.Asset;
import com.dihaozhe.hebaocounter.entity.dto.Bill;
import com.dihaozhe.hebaocounter.entity.vo.AssetVO;
import com.dihaozhe.hebaocounter.entity.vo.HomeVO;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import static com.dihaozhe.hebaocounter.utils.Money.formatMoney;
@Slf4j
@WebServlet(name = "getMonthSummaryServlet", value = "/get-month-summary-servlet")
public class GetMonthSummaryServlet extends HttpServlet {

    public void init() {}

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        HomeVO homeVO = new HomeVO();
        double monthOutcome = 0;
        double monthIncome = 0;
        double monthBalance = 0;
        // 获取用户id信息
        String accountId = request.getParameter("id");

        // 获取当前月份
        // 获取当前日期
        LocalDate currentDate = LocalDate.now();
        // 指定日期格式
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM");
        // 将日期格式化为字符串
        String formattedMonth = currentDate.format(formatter);

        // 请求资产接口
        BillDaoImpl billDao = new BillDaoImpl();
        List<Bill> bills = billDao.readBillsByAccountId(Integer.parseInt(accountId));

        for (int i = 0; i < bills.size(); i++) {
            Bill bill = bills.get(i);
            if (bill.getTime().substring(0, 7).equals(formattedMonth)) {
                if (bill.getBillType().equals("支出")) {
                    monthOutcome += bill.getMoney();
                }
                if (bill.getBillType().equals("收入")) {
                    monthIncome += bill.getMoney();
                }
            }
        }
        monthBalance = monthIncome - monthOutcome;

        homeVO.setMonthOutcome(monthOutcome);
        homeVO.setMonthIncome(monthIncome);
        homeVO.setMonthBalance(monthBalance);
        JSONObject json = new JSONObject();
        json.put("homeVO",homeVO);
        response.getWriter().print(json.toJSONString());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void destroy() {
    }
}

