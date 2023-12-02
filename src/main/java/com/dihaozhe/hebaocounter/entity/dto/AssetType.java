package com.dihaozhe.hebaocounter.entity.dto;

import lombok.Getter;

public enum AssetType {
    // 资金账户
    CASH ("1", "现金"),
    WE_CHAT_WALLET("2", "微信钱包"),
    WE_CHAT_CHANGE("3", "微信零钱通"),
    ZHI_FU_BAO("4", "支付宝"),
    YU_E_BAO("5", "余额宝"),
    YUN_SHAN_FU("6", "云闪付"),
    YIN_HANG_KA("7", "银行卡"),
    GONG_JI_JIN("8", "公积金"),
    QQ_WALLET("9", "QQ钱包"),
    JD_JIN_RONG("10", "京东金融"),
    YI_BAO_ZHANG_HU("11", "医保账户"),
    E_RMB("12", "数字人民币"),
    HUAWEI_WALLET("13", "华为钱包"),
    PAY_PAL("14", "PayPal"),
    OTHER_WALLET("15", "其他");

    // 信用卡账户


    // 充值账户

    // 投资理财账户
    // OTHER_LI_CAI("99", "其他理财");

    @Getter
    public final String id;
    public final String type;

    private AssetType(String id, String type) {
        this.id = id;
        this.type = type;
    }

}
