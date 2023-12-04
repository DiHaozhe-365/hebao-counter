package com.dihaozhe.hebaocounter.controller;

import com.alibaba.fastjson.JSONObject;
import com.dihaozhe.hebaocounter.dao.impl.BillDaoImpl;
import com.dihaozhe.hebaocounter.entity.vo.OutcomeTypeVO;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@WebServlet(name = "getOutcomeTypeArrayServlet", value = "/get-outcome-type-array-servlet")
public class GetOutcomeTypeArrayServlet extends HttpServlet {

    public void init() {}

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        List<OutcomeTypeVO> outcomeTypeArray = new ArrayList<>();
        // 获取用户id信息
        String accountId = request.getParameter("id");

        // 请求资产接口
        BillDaoImpl billDao = new BillDaoImpl();
        outcomeTypeArray = billDao.readOutcomeBillsByAccountIdAndGroupByClass(Integer.parseInt(accountId));


        JSONObject json = new JSONObject();
        json.put("outcomeTypeArray",outcomeTypeArray);
        response.getWriter().print(json.toJSONString());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void destroy() {
    }
}

