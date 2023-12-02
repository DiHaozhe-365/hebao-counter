package com.dihaozhe.hebaocounter.utils;

public class Money {
    public static String formatMoney(String money) {
        // 将输入的字符串按逗号分隔
        String[] parts = money.split("\\s+");
        // 将结果重新拼接成一个字符串，并按格式化要求输出
        return String.format("%,.2f", Double.parseDouble(parts[0]));
    }
}
