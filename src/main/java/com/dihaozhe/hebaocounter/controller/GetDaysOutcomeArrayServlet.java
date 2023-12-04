package com.dihaozhe.hebaocounter.controller;

import com.alibaba.fastjson.JSONObject;
import com.dihaozhe.hebaocounter.dao.impl.BillDaoImpl;
import com.dihaozhe.hebaocounter.entity.dto.Bill;
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
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@WebServlet(name = "getDaysOutcomeArrayServlet", value = "/get-days-outcome-array-servlet")
public class GetDaysOutcomeArrayServlet extends HttpServlet {

    public void init() {}

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        List<Double> daysOutcomeArray = new ArrayList<>();
        // 获取用户id信息
        String accountId = request.getParameter("id");
        String date = "";

        // 获取当前月份天数
        YearMonth currentYearMonth = YearMonth.now();
        int daysInMonth = currentYearMonth.lengthOfMonth();

        // 创建一个长度为daysInMonth的数组，每个元素初始数值为0
        for (int i = 0; i < daysInMonth; i++) {
            daysOutcomeArray.add(Double.valueOf(0));
        }

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
            // 筛选出当前月份的账单
            if (bill.getTime().substring(0, 7).equals(formattedMonth)) {
                // 筛选出当前月份的支出账单
                if (bill.getBillType().equals("支出")) {
                    // 判断是哪一天的账单
                    if (bill.getTime().substring(8,9).equals("0")) {
                        date = bill.getTime().substring(9,10);
                    } else {
                        date = bill.getTime().substring(8,10);
                    }
                    double money = daysOutcomeArray.get(Integer.parseInt(date)-1) + bill.getMoney();
                    daysOutcomeArray.set(Integer.parseInt(date)-1, money);
                }
            }
        }

        JSONObject json = new JSONObject();
        json.put("daysOutcomeArray",daysOutcomeArray);
        response.getWriter().print(json.toJSONString());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void destroy() {
    }
}

