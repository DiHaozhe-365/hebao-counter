package com.dihaozhe.hebaocounter.dao.impl;

import com.dihaozhe.hebaocounter.dao.AccountDao;
import com.dihaozhe.hebaocounter.entity.dto.Account;
import lombok.extern.slf4j.Slf4j;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import static com.dihaozhe.hebaocounter.utils.MysqlConnector.close;
import static com.dihaozhe.hebaocounter.utils.MysqlConnector.getConnection;

@Slf4j
public class AccountDaoImpl implements AccountDao {
    String sql;
    Connection con;
    PreparedStatement pstmt;
    ResultSet rs;
    Account account;
    List<Account> accounts;

    @Override
    public void createAccount(Account account) {
        sql = "INSERT INTO tb_account (username, password, nick_name, email, phone) VALUES (?, ?, ?, ?, ?)";

        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,account.getUsername());
            pstmt.setString(2,account.getPassword());
            pstmt.setString(3,account.getNickName());
            pstmt.setString(4,account.getEmail());
            pstmt.setString(5,account.getPhone());
            pstmt.executeUpdate();
        } catch (Exception e) {
            log.error("新增账号失败");
            throw new RuntimeException(e);
        } finally {
            close(rs);
            close(pstmt);
            close(con);
        }
    }

    @Override
    public Account readAccountById(int id) {
        sql = "SELECT * FROM tb_account WHERE id = " + id;
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                account = new Account();
                account.setId(Integer.valueOf(rs.getString(1)));
                account.setUsername(rs.getString(2));
                account.setPassword(rs.getString(3));
                account.setRole(rs.getString(4));
                account.setNickName(rs.getString(5));
                account.setAvatar(rs.getString(6));
                account.setEmail(rs.getString(7));
                account.setPhone(rs.getString(8));
                account.setCreateTime(rs.getDate(9));
                account.setUpdateTime(rs.getDate(10));
                account.setStatus(rs.getString(11));
                return account;
            } else {
                log.info("未查询到di[" + id + "]");
                return null;
            }
        } catch (Exception e) {
            log.error("查询账号失败");
            throw new RuntimeException(e);
        } finally {
            close(rs);
            close(pstmt);
            close(con);
        }
    }

    @Override
    public Account readAccountByUsername(Account account) {
        sql = "SELECT * FROM tb_account WHERE username = '" + account.getUsername() + "'";
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                account = new Account();
                account.setId(Integer.valueOf(rs.getString(1)));
                account.setUsername(rs.getString(2));
                account.setPassword(rs.getString(3));
                account.setRole(rs.getString(4));
                account.setNickName(rs.getString(5));
                account.setAvatar(rs.getString(6));
                account.setEmail(rs.getString(7));
                account.setPhone(rs.getString(8));
                account.setCreateTime(rs.getDate(9));
                account.setUpdateTime(rs.getDate(10));
                account.setStatus(rs.getString(11));
                return account;
            } else {
                log.info("未查询到账号[" + account.getUsername() + "]");
                return null;
            }
        } catch (Exception e) {
            log.error("查询账号失败");
            throw new RuntimeException(e);
        } finally {
            close(rs);
            close(pstmt);
            close(con);
        }
    }

    @Override
    public Account readAccountByUsernameAndPassword(Account account) {
        sql = "SELECT * FROM tb_account WHERE username = '" + account.getUsername() + "' AND password = '" + account.getPassword() + "'";
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                account = new Account();
                account.setId(Integer.valueOf(rs.getString(1)));
                account.setUsername(rs.getString(2));
                account.setPassword(rs.getString(3));
                account.setRole(rs.getString(4));
                account.setNickName(rs.getString(5));
                account.setAvatar(rs.getString(6));
                account.setEmail(rs.getString(7));
                account.setPhone(rs.getString(8));
                account.setCreateTime(rs.getDate(9));
                account.setUpdateTime(rs.getDate(10));
                account.setStatus(rs.getString(11));
                return account;
            } else {
                log.info("未查询到账号[" + account.getUsername() + "]");
                return null;
            }
        } catch (Exception e) {
            log.error("查询账号失败");
            throw new RuntimeException(e);
        } finally {
            close(rs);
            close(pstmt);
            close(con);
        }
    }

    @Override
    public List<Account> readAccounts() {
        account = new Account();
        accounts = new ArrayList<>();
        sql = "SELECT * FROM tb_account";
        try {
            con = getConnection();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                account.setId(Integer.valueOf(rs.getString(1)));
                account.setUsername(rs.getString(2));
                account.setPassword(rs.getString(3));
                account.setRole(rs.getString(4));
                account.setNickName(rs.getString(5));
                account.setAvatar(rs.getString(6));
                account.setEmail(rs.getString(7));
                account.setPhone(rs.getString(8));
                account.setCreateTime(rs.getDate(9));
                account.setUpdateTime(rs.getDate(10));
                account.setStatus(rs.getString(11));
                log.info("查询账号表成功");
                accounts.add(account);
            }
            return accounts;
        } catch (Exception e) {
            log.error("查询账号表失败");
            throw new RuntimeException(e);
        } finally {
            close(rs);
            close(pstmt);
            close(con);
        }
    }

    @Override
    public void updateAccount(Account account) {

    }

    @Override
    public void deleteAccount(int id) {

    }
}
