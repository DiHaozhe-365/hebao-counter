package com.dihaozhe.hebaocounter.controller;

import com.alibaba.fastjson.JSONObject;
import com.dihaozhe.hebaocounter.dao.impl.AssetDaoImpl;
import com.dihaozhe.hebaocounter.entity.dto.Asset;
import com.dihaozhe.hebaocounter.entity.vo.AssetVO;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import static com.dihaozhe.hebaocounter.utils.Money.formatMoney;

@Slf4j
@WebServlet(name = "getAssetsServlet", value = "/get-assets-servlet")
public class GetAssetsServlet extends HttpServlet {

    public void init() {}

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        Asset asset = new Asset();
        double totalAssetList = 0;
        double totalBorrowOut = 0; // 总借出
        double totalAsset = 0;  // 总资产
        double totalBorrowIn = 0;  // 总借入
        double totalDebt = 0;  // 总负债
        double netMoney = 0;  // 净资产

        // 获取用户id信息
        String assetId = request.getParameter("id");

        // 请求资产接口
        AssetDaoImpl assetDao = new AssetDaoImpl();
        List<Asset> assets = assetDao.readAssetsByAccountId(Integer.parseInt(assetId));
        AssetVO assetVO = new AssetVO();
        assetVO.setAssets(assets);

        // 计算资产列表总额
        for (int i = 0; i < assets.size(); i++) {
            asset = assets.get(i);
            totalAssetList += asset.getMoney();
        }
        if (totalAssetList > 0) {
            assetVO.setTotalAssetList("￥" + formatMoney(totalAssetList+""));
        } else {
            double totalAssetListM = totalAssetList - totalAssetList - totalAssetList;
            assetVO.setTotalAssetList("-￥" + formatMoney(totalAssetListM+""));
        }

        // 计算总借入
        // 债务接口
        assetVO.setTotalBorrowIn("￥" + formatMoney(totalBorrowIn+""));
        // 计算总借出
        // 债务接口
        assetVO.setTotalBorrowOut("￥" + formatMoney(totalBorrowOut+""));

        // 计算总资产
        if (totalAssetList > 0) {
            totalAsset = totalAssetList + totalBorrowOut;
        } else {
            totalAsset = totalBorrowOut;
        }
        assetVO.setTotalAsset("￥" + formatMoney(totalAsset+""));

        // 计算总负债
        if (totalAssetList > 0) {
            totalDebt = totalBorrowIn;
        } else {
            totalDebt = totalBorrowIn - totalAssetList;
        }
        assetVO.setTotalDebt("￥" + formatMoney(totalDebt+""));

        // 计算净资产
        netMoney = totalAsset - totalDebt;
        if (netMoney > 0) {
            assetVO.setNetMoney("￥" + formatMoney(netMoney+""));
        } else {
            double netMoneyM = netMoney - netMoney - netMoney;
            assetVO.setNetMoney("-￥" + formatMoney(netMoneyM+""));
        }
        JSONObject json = new JSONObject();
        json.put("assetVO",assetVO);
        response.getWriter().print(json.toJSONString());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    public void destroy() {
    }
}
