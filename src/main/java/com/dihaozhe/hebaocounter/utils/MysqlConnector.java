package com.dihaozhe.hebaocounter.utils;

import lombok.extern.slf4j.Slf4j;

import java.sql.Connection;
import java.sql.DriverManager;

import static com.dihaozhe.hebaocounter.config.MysqlConfig.*;

@Slf4j
public class MysqlConnector {
    public static Connection getConnection() {
        Connection con = null;
        try {
            // 注册数据库驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
            // 定义连接数据库的 url、user、password
            String url = "jdbc:mysql://" + IP_PORT + "/" + DATABASE + "?useSSL=false&serverTimezone=GMT&characterEncoding=utf-8";
            // 获取数据库连接对象
            con = DriverManager.getConnection(url, USER, PASSWORD);
        } catch(Exception e) {
            log.error("数据库 " + DATABASE + " 连接失败");
            e.printStackTrace();
        }
        // 返回连接对象
        return con;
    }

    public static void close(AutoCloseable closeable) {
        if (closeable != null) {
            try {
                closeable.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
