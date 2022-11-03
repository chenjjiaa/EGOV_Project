package com.gg.egov.util;

import javax.servlet.http.HttpServletRequest;
import java.util.ResourceBundle;

public class StringUtil {

    public static ResourceBundle bundleOrgType = ResourceBundle.getBundle("com.gg.egov.resource.Message_CN");
    public static ResourceBundle bundleCurrency = ResourceBundle.getBundle("com.gg.egov.resource.Currency");


    /**
     * 因为机构类型在数据库底层用的是数字来描述
     * 比如：0 是外汇管理局， 1 是银行
     * 为了解耦合，使用配置文件才是最优选。
     *
     * @param orgcode
     * @return
     */
    public static String getOrgType(String orgcode) {
        return bundleOrgType.getString(orgcode);
    }

    public static String getInvCountry(String country){
        ResourceBundle bundleCountry = ResourceBundle.getBundle("com.gg.egov.resource.Message_Country");
        return bundleCountry.getString(country);
    }

    public static String getCurrency(String currency){
        return bundleCurrency.getString(currency);
    }

    public static String getServerPath(HttpServletRequest request){
        String path = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
        return path;
    }

    public static boolean isNotEmpty(String string){
        return string != null && string.trim().length() != 0;
    }

//    public static void main(String[] args) {
//        System.out.println(getInvCountry("0"));
//    }

}