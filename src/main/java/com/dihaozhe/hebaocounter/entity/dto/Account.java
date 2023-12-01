package com.dihaozhe.hebaocounter.entity.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * (Account)实体类
 *
 * @author 邸浩哲
 * @since 2023-11-04 09:25:15
 */
@Data
public class Account implements Serializable {
    private static final long serialVersionUID = 913348703326727564L;
    /**
     * 账号id
     */
    private Integer id;
    /**
     * 账号
     */
    private String username;
    /**
     * 密码
     */
    private String password;
    /**
     * 角色
     */
    private String role;
    /**
     * 昵称
     */
    private String nickName;
    /**
     * 头像
     */
    private String avatar;
    /**
     * 邮箱
     */
    private String email;
    /**
     * 电话
     */
    private String phone;
    /**
     * 注册日期
     */
    private Date createTime;
    /**
     * 更新日期
     */
    private Date updateTime;
    /**
     * 状态
     */
    private String status;
}