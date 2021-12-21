package com.bk.tuanpm.webtoeic.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class DateTimeUtil {
	public static String getDateStringForVNP() {
		Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));;
		Date date = cld.getTime();

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmss");

		return sdf2.format(date);
	}
}
