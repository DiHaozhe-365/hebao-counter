package com.dihaozhe.hebaocounter.entity.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * (Bill)实体类
 *
 * @author 邸浩哲
 * @since 2023-11-07 13:56:36
 */
@Data
public class Bill implements Serializable {
    private static final long serialVersionUID = -76525917207926373L;
    /**
     * 账单id
     */
    private Integer id;
    /**
     * 用户id
     */
    private Integer accountId;
    /**
     * 资产id
     */
    private Integer assetId;
    /**
     * 账单类型
     */
    private String billType;
/**
 * 账单分类
 */
    private String billClass;
    /**
     * 账单备注
     */
    private String description;
    /**
     * 账单金额
     */
    private Double money;
    /**
     * 账单时间
     */
    private String time;
    /**
     * 创建时间
     */
    private String createTime;
    /**
     * 更新时间
     */
    private String updateTime;
    /**
     * 账单状态
     */
    private String status;

}
