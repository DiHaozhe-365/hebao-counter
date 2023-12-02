package com.dihaozhe.hebaocounter.entity.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * (Asset)实体类
 *
 * @author 邸浩哲
 * @since 2023-11-04 15:34:36
 */
@Data
public class Asset implements Serializable {
    private static final long serialVersionUID = 616780844844030938L;
    /**
     * 资产id
     */
    private Integer id;
    /**
     * 用户id
     */
    private Integer accountId;
    /**
     * 资产类型
     */
    private String type;
    /**
     * 资产名称
     */
    private String name;
    /**
     * 资产余额
     */
    private Double money;
    /**
     * 币种
     */
    private String moneyType;
    /**
     * 计入总资产
     */
    private String isInclude;
    /**
     * 状态
     */
    private String status;
    /**
     * 创建时间
     */
    private String createTime;
    /**
     * 更新时间
     */
    private Date updateTime;

}