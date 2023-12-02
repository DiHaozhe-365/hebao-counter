package com.dihaozhe.hebaocounter.dao;

import com.dihaozhe.hebaocounter.entity.dto.Asset;

import java.util.List;

public interface AssetDao {
    // Create 增加资产
    void createAsset(Asset asset);

    // Read 查询资产
    List<Asset> readAssetsByAccountId(int accountId);
    Asset readAssetById(int id);

    // Update 更新资产
    void updateAsset(Asset asset);

    // Delete 删除资产
    void deleteAsset(int id);
}
