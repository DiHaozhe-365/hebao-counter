package com.dihaozhe.hebaocounter.dao;

import com.dihaozhe.hebaocounter.entity.dto.Bill;

import java.util.List;

public interface BillDao {
    // Create 增加账单
    void createBill(Bill bill);

    // Read 查询账单
    List<Bill> readBillsByAccountId(int accountId);
    List<Bill> readBillsByAssetId(int assetId);
    Bill readBillById(int id);
    // Update 更新账单
//    void updateBill(Bill bill);

    // Delete 删除账单
    void deleteBill(int id);
}
