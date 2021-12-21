package com.bk.tuanpm.webtoeic.util;

public class CommonUtil {
    public static String convertTimeNumberToTimeView(int timeNumber) {
        int intMinutes = timeNumber / 60;
        int intSeconds = timeNumber % 60;
        String strMinutes = intMinutes < 10 ? "0" + intMinutes : String.valueOf(intMinutes);
        String strSeconds = intSeconds < 10 ? "0" + intSeconds : String.valueOf(intSeconds);

        return strMinutes + ":" + strSeconds;
    }
}
