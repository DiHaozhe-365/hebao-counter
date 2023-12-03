package com.dihaozhe.hebaocounter.controller;

import com.alibaba.fastjson.JSONObject;
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
@WebServlet(name = "getAssetByIdServlet", value = "/get-asset-by-id-servlet")
public class GetAssetByIdServlet extends HttpServlet {

    public void init() {}

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        // 获取用户表单信息
        String assetId = request.getParameter("id");

        // 请求创建资产接口
        AssetDaoImpl assetDao = new AssetDaoImpl();
        Asset asset = assetDao.readAssetById(Integer.parseInt(assetId));
        JSONObject json = new JSONObject();
        json.put("asset",asset);
        response.getWriter().print(json.toJSONString());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void destroy() {
    }
}
