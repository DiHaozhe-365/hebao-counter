package com.dihaozhe.hebaocounter.dao.impl;

import com.dihaozhe.hebaocounter.dao.AssetDao;
import com.dihaozhe.hebaocounter.entity.dto.Asset;
import lombok.extern.slf4j.Slf4j;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import static com.dihaozhe.hebaocounter.utils.MysqlConnector.close;
import static com.dihaozhe.hebaocounter.utils.MysqlConnector.getConnection;

@Slf4j
public class AssetDaoImpl implements AssetDao {
    String sql;
    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
    Asset asset;
    List<Asset> assets;

    @Override
    public void createAsset(Asset asset) {
//        sql = "INSERT INTO tb_asset (account_id, type, name, money, money_type, is_included) VALUES (?, ?, ?, ?, ?, ?)";
        sql = "INSERT INTO tb_asset (account_id, type, name, money) VALUES (?, ?, ?, ?)";
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, String.valueOf(asset.getAccountId()));
            pstmt.setString(2,asset.getType());
            pstmt.setString(3,asset.getName());
            pstmt.setString(4, String.valueOf(asset.getMoney()));
//            pstmt.setString(5,asset.getMoneyType());
//            pstmt.setString(6,asset.getIsInclude());
            pstmt.executeUpdate();
            log.info("新增资产[" + asset + "]成功");
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
    public List<Asset> readAssetsByAccountId(int accountId) {
        assets = new ArrayList<>();
        sql = "SELECT * FROM tb_asset WHERE account_id = " + accountId + " AND status != '已删除'";

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                asset = new Asset();
                asset.setId(Integer.valueOf(rs.getString(1)));
                asset.setAccountId(Integer.valueOf(rs.getString(2)));
                asset.setType(rs.getString(3));
                asset.setName(rs.getString(4));
                asset.setMoney(rs.getDouble(5));
                asset.setMoneyType(rs.getString(6));
                asset.setIsInclude(rs.getString(7));
                asset.setStatus(rs.getString(8));
                assets.add(asset);
            }
        } catch (Exception e) {
            log.error("查询资产表失败");
            throw new RuntimeException(e);
        } finally {
            close(rs);
            close(pstmt);
            close(con);
        }
        return assets;
    }

    @Override
    public Asset readAssetById(int id) {
        sql = "SELECT * FROM tb_asset WHERE id = " + id + " AND status != '已删除'";

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                asset = new Asset();
                asset.setId(Integer.valueOf(rs.getString(1)));
                asset.setAccountId(Integer.valueOf(rs.getString(2)));
                asset.setType(rs.getString(3));
                asset.setName(rs.getString(4));
                asset.setMoney(rs.getDouble(5));
                asset.setMoneyType(rs.getString(6));
                asset.setIsInclude(rs.getString(7));
                asset.setStatus(rs.getString(8));
                asset.setCreateTime(rs.getString(9));
            }
        } catch (Exception e) {
            log.error("查询资产表失败");
            throw new RuntimeException(e);
        } finally {
            close(rs);
            close(pstmt);
            close(con);
        }
        return asset;
    }

    @Override
    public void updateAsset(Asset asset) {
        sql = "UPDATE tb_asset SET type = ?, name = ?, money = ? WHERE id = ?";
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,asset.getType());
            pstmt.setString(2,asset.getName());
            pstmt.setString(3, String.valueOf(asset.getMoney()));
            pstmt.setString(4, String.valueOf(asset.getId()));
//            pstmt.setString(5,asset.getMoneyType());
//            pstmt.setString(6,asset.getIsInclude());
            pstmt.executeUpdate();
            log.info("修改资产[" + asset + "]成功");
        } catch (Exception e) {
            log.error("修改资产失败");
            throw new RuntimeException(e);
        } finally {
            close(rs);
            close(pstmt);
            close(con);
        }
    }

    @Override
    public void deleteAsset(int id) {
        sql = "UPDATE tb_asset SET status = '已删除' WHERE id = " + id;

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.executeUpdate();
            log.info("删除资产" + id + "成功");
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
