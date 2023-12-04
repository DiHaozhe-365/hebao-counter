package com.dihaozhe.hebaocounter.dao.impl;

import com.dihaozhe.hebaocounter.dao.BillDao;
import com.dihaozhe.hebaocounter.entity.dto.Bill;
import com.dihaozhe.hebaocounter.entity.vo.OutcomeTypeVO;
import lombok.extern.slf4j.Slf4j;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import static com.dihaozhe.hebaocounter.utils.MysqlConnector.close;
import static com.dihaozhe.hebaocounter.utils.MysqlConnector.getConnection;

@Slf4j
public class BillDaoImpl implements BillDao {
    String sql;
    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
    Bill bill;
    OutcomeTypeVO outcomeTypeVO;
    List<Bill> bills;

    @Override
    public void createBill(Bill bill) {
        sql = "INSERT INTO tb_bill (account_id, asset_id, bill_type, bill_class, description, money, time) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, String.valueOf(bill.getAccountId()));
            pstmt.setString(2, String.valueOf(bill.getAssetId()));
            pstmt.setString(3,bill.getBillType());
            pstmt.setString(4,bill.getBillClass());
            pstmt.setString(5,bill.getDescription());
            pstmt.setString(6, String.valueOf(bill.getMoney()));
            pstmt.setString(7, String.valueOf(bill.getTime()));
            pstmt.executeUpdate();
            log.info("新增账单[" + bill + "]成功");
        } catch (Exception e) {
            log.error("新增资产失败");
            throw new RuntimeException(e);
        } finally {
            close(rs);
            close(pstmt);
            close(con);
        }
    }

    @Override
    public List<Bill> readBillsByAccountId(int accountId) {
        bills = new ArrayList<>();
        sql = "SELECT * FROM tb_bill WHERE account_id = " + accountId + " AND status != '已删除'";

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                bill = new Bill();
                bill.setId(Integer.valueOf(rs.getString(1)));
                bill.setAccountId(Integer.valueOf(rs.getString(2)));
                bill.setAssetId(Integer.valueOf(rs.getString(3)));
                bill.setBillType(rs.getString(4));
                bill.setBillClass(rs.getString(5));
                bill.setDescription(rs.getString(6));
                bill.setMoney(rs.getDouble(7));
                bill.setTime(rs.getString(8));
                bill.setCreateTime(rs.getString(9));
                bill.setUpdateTime(rs.getString(10));
                bill.setStatus(rs.getString(11));
                bills.add(bill);
            }
        } catch (Exception e) {
            log.error("查询账单表失败");
            throw new RuntimeException(e);
        } finally {
            close(rs);
            close(pstmt);
            close(con);
        }
        return bills;
    }

    @Override
    public List<OutcomeTypeVO> readOutcomeBillsByAccountIdAndGroupByClass(int accountId) {
        List<OutcomeTypeVO> outcomeTypeArray = new ArrayList<>();
        sql = "SELECT SUM(money), bill_class FROM (" +
                "SELECT * FROM tb_bill WHERE YEAR(time) = YEAR(CURRENT_DATE()) " +
                "  AND MONTH(time) = MONTH(CURRENT_DATE())" +
                ") AS subquery WHERE account_id = " + accountId + " AND status != '已删除' AND bill_type = '支出' GROUP BY bill_class";

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                outcomeTypeVO = new OutcomeTypeVO();
                outcomeTypeVO.setValue(rs.getDouble(1));
                outcomeTypeVO.setName(rs.getString(2));
                outcomeTypeArray.add(outcomeTypeVO);
            }
        } catch (Exception e) {
            log.error("查询账单表失败");
            throw new RuntimeException(e);
        } finally {
            close(rs);
            close(pstmt);
            close(con);
        }
        return outcomeTypeArray;
    }

    @Override
    public List<Bill> readBillsByAssetId(int assetId) {
        bills = new ArrayList<>();
        sql = "SELECT * FROM tb_bill WHERE asset_id = " + assetId + " AND status != '已删除' ORDER BY time DESC";

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                bill = new Bill();
                bill.setId(Integer.valueOf(rs.getString(1)));
                bill.setAccountId(Integer.valueOf(rs.getString(2)));
                bill.setAssetId(Integer.valueOf(rs.getString(3)));
                bill.setBillType(rs.getString(4));
                bill.setBillClass(rs.getString(5));
                bill.setDescription(rs.getString(6));
                bill.setMoney(rs.getDouble(7));
                bill.setTime(rs.getString(8));
                bill.setCreateTime(rs.getString(9));
                bill.setUpdateTime(rs.getString(10));
                bill.setStatus(rs.getString(11));
                bills.add(bill);
            }
        } catch (Exception e) {
            log.error("查询账单表失败");
            throw new RuntimeException(e);
        } finally {
            close(rs);
            close(pstmt);
            close(con);
        }
        return bills;
    }

    @Override
    public Bill readBillById(int id) {
        sql = "SELECT * FROM tb_bill WHERE id = " + id;

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                bill = new Bill();
                bill.setId(Integer.valueOf(rs.getString(1)));
                bill.setAccountId(Integer.valueOf(rs.getString(2)));
                bill.setAssetId(Integer.valueOf(rs.getString(3)));
                bill.setBillType(rs.getString(4));
                bill.setBillClass(rs.getString(5));
                bill.setDescription(rs.getString(6));
                bill.setMoney(rs.getDouble(7));
                bill.setTime(rs.getString(8));
                bill.setCreateTime(rs.getString(9));
                bill.setUpdateTime(rs.getString(10));
                bill.setStatus(rs.getString(11));
            }
        } catch (Exception e) {
            log.error("查询账单表失败");
            throw new RuntimeException(e);
        } finally {
            close(rs);
            close(pstmt);
            close(con);
        }
        return bill;
    }

    @Override
    public void deleteBill(int id) {
        sql = "UPDATE tb_bill SET status = '已删除' WHERE id = " + id;

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.executeUpdate();
            log.info("删除账单" + id + "成功");
        } catch (Exception e) {
            log.error("删除资产失败");
            throw new RuntimeException(e);
        } finally {
            close(rs);
            close(pstmt);
            close(con);
        }
    }
}
