package com.dihaozhe.hebaocounter.config;

import org.apache.commons.codec.digest.DigestUtils;

/**
 * 在这里配置MD5加密算法
 */
public class Md5Config {

    /**
     * 盐值（注意修改此项前，确保数据库内容为空）
     */
    public static final String SALT = "DiHaozhe";

    /**
     * 加密算法（注意修改此项前，确保数据库内容为空）
     */
    public static String md5Encrypt(String password) {
        return DigestUtils.md5Hex( SALT + password + SALT);
    }
}