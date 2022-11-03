package com.gg.egov.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {

    public static String format(String format, Date date){
        return new SimpleDateFormat(format).format(date);
    }
}
