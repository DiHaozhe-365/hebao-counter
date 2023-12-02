package com.dihaozhe.hebaocounter.entity.dto;

import lombok.Getter;

public enum BillClass {
    // 支出一级分类
    FOOD ("1", "支出", "一级分类", "三餐", "food"),
    SNACK ("2", "支出", "一级分类", "零食", "snack"),
    CLOTHES ("3", "支出", "一级分类", "衣服", "clothes"),
    TRAFFIC ("4", "支出", "一级分类", "交通", "traffic"),
    TRAVEL ("5", "支出", "一级分类", "旅行", "travel"),
    CHILD ("6", "支出", "一级分类", "孩子", "child"),
    PET ("7", "支出", "一级分类", "宠物", "pet"),
    PHONE ("8", "支出", "一级分类", "话费网费", "phone"),
    ALCOHOL_TOBACCO ("9", "支出", "一级分类", "烟酒", "alcohol-tobacco"),
    STUDY ("10", "支出", "一级分类", "学习", "study"),
    DAILY_NECESSITIES ("11", "支出", "一级分类", "日用品", "daily-necessities"),
    HOUSE ("12", "支出", "一级分类", "住房", "house"),
    MAKEUP ("13", "支出", "一级分类", "美妆", "makeup"),
    MEDICAL ("14", "支出", "一级分类", "医疗", "medical"),
    RED_PACKET_OUT ("15", "支出", "一级分类", "发红包", "small-red-packet"),
    CAR_OIL ("16", "支出", "一级分类", "汽车/加油", "car-oil"),
    ENTERTAINMENT ("17", "支出", "一级分类", "娱乐", "entertainment"),
    PRESENT ("18", "支出", "一级分类", "请客送礼", "present"),
    CAMERA ("19", "支出", "一级分类", "电器数码", "camera"),
    SPORT ("20", "支出", "一级分类", "运动", "sport"),
    WATER_E_GAS ("21", "支出", "一级分类", "水电煤", "water-electricity-gas"),
    OTHER_OUTCOME ("22", "支出", "一级分类", "其他支出", "other"),

    // 收入一级分类
    SALARY ("23", "收入", "一级分类", "工资", "salary"),
    LIVE_COST ("24", "收入", "一级分类", "生活费", "live-cost"),
    RED_PACKET_IN ("25", "收入", "一级分类", "收红包", "small-red-packet"),
    EXTRA_INCOME ("26", "收入", "一级分类", "外快", "extra-income"),
    STOCK ("27", "收入", "一级分类", "股票基金", "stock"),
    OTHER_INCOME ("28", "收入", "一级分类", "其他收入", "other");



    @Getter
    public final String id;
    public final String type;
    public final String level;
    public final String name;
    public final String icon;

    private BillClass(String id, String type, String level, String name, String icon) {
        this.id = id;
        this.type = type;
        this.level = level;
        this.name = name;
        this.icon = icon;
    }

}
