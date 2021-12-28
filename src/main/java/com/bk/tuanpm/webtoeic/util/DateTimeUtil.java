package com.bk.tuanpm.webtoeic.util;

import java.text.ParseException;
import static java.time.DayOfWeek.MONDAY;
import static java.time.DayOfWeek.SUNDAY;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import com.mysql.fabric.xmlrpc.base.Array;

public class DateTimeUtil {
	public static String getDateStringForVNP() {
		Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
		Date date = cld.getTime();

		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmss");

		return sdf2.format(date);
	}

	public static String generateDateNow(String patternFormat) {
		LocalDate localDate = LocalDate.now();// For reference
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern(patternFormat);
		String formattedString = localDate.format(formatter);

		return formattedString;
	}

	public static Date convertStringToDate(String date) throws ParseException {
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmss");
		return sdf2.parse(date);
	}
	
	public static String convertDate2String(Date date) throws ParseException {
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd");
		return sdf2.format(date);
	}

	public static int getCurrentWeekNum() {
		Calendar calendar = new GregorianCalendar();
		Date trialTime = new Date();
		calendar.setTime(trialTime);
		return calendar.get(Calendar.WEEK_OF_YEAR);
	}

	public static String getCurrentWeekRange() {
		LocalDate today = LocalDate.now();

		// Go backward to get Monday
		LocalDate monday = today;
		while (monday.getDayOfWeek() != DayOfWeek.MONDAY) {
			monday = monday.minusDays(1);
		}
		// Go forward to get Sunday
		LocalDate sunday = today;
		while (sunday.getDayOfWeek() != DayOfWeek.SUNDAY) {
			sunday = sunday.plusDays(1);
		}
		return "" + monday + " - " + sunday;
	}

	public static List<String> gettWeekListYear(int year) {
		Integer weeksOfYear = Calendar.getInstance().getActualMaximum(Calendar.WEEK_OF_YEAR);
		List<String> rangeList = new ArrayList<String>();
		String range = new String();

		for (int i = 1; i <= weeksOfYear; i++) {
			Calendar calendar = Calendar.getInstance();
			calendar.clear();
			calendar.set(Calendar.WEEK_OF_YEAR, i);
			calendar.set(Calendar.YEAR, year);
			// Now get the first day of week.
			Date date = calendar.getTime();
			// Get the end week
			calendar.setTime(date);
			calendar.add(Calendar.DATE, 7);
			Date end = calendar.getTime();
			try {
				range = "Tuần " + i + ": " + convertDate2String(date) + " - " + convertDate2String(end);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			rangeList.add(range);
		}
		return rangeList;

	}
}
