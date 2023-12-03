package com.dihaozhe.hebaocounter.controller;

import com.dihaozhe.hebaocounter.dao.impl.AssetDaoImpl;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Slf4j
@WebServlet(name = "deleteAssetServlet", value = "/delete-asset-servlet")
public class DeleteAssetServlet extends HttpServlet {

    public void init() {}

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        // 获取用户表单信息
        String id = request.getParameter("id");

        // 判断数据合法

        // 请求删除资产接口
        AssetDaoImpl assetDao = new AssetDaoImpl();
        assetDao.deleteAsset(Integer.parseInt(id));
        out.println("<script>alert('删除成功');window.location.href='views/asset.jsp';</script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void destroy() {
    }
}
