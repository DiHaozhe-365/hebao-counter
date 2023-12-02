package com.dihaozhe.hebaocounter.entity.vo;

import com.dihaozhe.hebaocounter.entity.dto.Asset;
import lombok.Data;

import java.util.List;

@Data
public class AssetVO {
    String netMoney;  // 净资产
    String totalAsset;  // 总资产
    String totalDebt;  // 总负债
    String totalBorrowIn;  // 总借入
    String totalBorrowOut; // 总借出
    String totalAssetList;  // 资产列表总额
    List<Asset> assets;
}