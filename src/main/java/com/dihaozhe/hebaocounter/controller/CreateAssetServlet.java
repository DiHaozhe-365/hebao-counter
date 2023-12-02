package com.dihaozhe.hebaocounter.controller;


import com.dihaozhe.hebaocounter.dao.impl.AssetDaoImpl;
import com.dihaozhe.hebaocounter.entity.dto.Asset;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Slf4j
@WebServlet(name = "createAssetServlet", value = "/create-asset-servlet")
public class CreateAssetServlet extends HttpServlet {

    public void init() {}

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        // 获取用户表单信息
        String accountId = request.getParameter("account-id");
        String type = request.getParameter("type");
        String name = request.getParameter("name");
        String money = request.getParameter("money");
//        String moneyType = request.getParameter("money-type");
//        String isInclude = request.getParameter("is-include");
//        String status = request.getParameter("status");

        // 判断数据合法

        // 数据写入对象
        Asset asset = new Asset();
        asset.setAccountId(Integer.valueOf(accountId));
        asset.setType(type);
        asset.setName(name);
        asset.setMoney(Double.valueOf(money));

        // 请求创建资产接口
        AssetDaoImpl assetDao = new AssetDaoImpl();
        assetDao.createAsset(asset);
        out.println("<script>alert('创建成功');window.location.href='views/asset.jsp';</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void destroy() {
    }
}
