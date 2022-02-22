package com.bk.tuanpm.webtoeic.common;

import java.util.Arrays;
import java.util.List;

public class CommonConst {
    public static int[] LIST_ROW_NUMBER_SET_QUESTION = new int[]{1, 2, 3, 8, 11, 14, 17, 20, 26, 29, 32, 35};
    public static final String FLG_ON = "0";
    public static final String FLG_OFF = "1";

    public static final String CREATE = "0";
    public static final String APPROVE = "1";
    public static final String REJECT = "2";

    public static final String ROLE_TUTORIAL = "ROLE_TUTORIAL";
    public static final String ROLE_MEMBER = "ROLE_MEMBER";
    public static final String ROLE_MEMBER_VIP = "ROLE_MEMBER_VIP";
    public static final String ROLE_CONTENT = "ROLE_CONTENT";
    public static final String ROLE_MANAGER = "ROLE_MANAGER";
    
    private static final List<String> FILE_EXTENSION = Arrays.asList("image/png", "image/jpeg", 
    		"audio/mpeg","application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"
    		, "application/vnd.ms-excel");
}
