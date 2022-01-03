package com.bk.tuanpm.webtoeic.util;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtil {
	public static String formatPost(String content) {

		String newFormat = "";
		List<String> urls = extractUrls(content);
		for (String string : urls) {
			newFormat = "<a href="+string+">"+string+"</a>";
			content = content.replace(string, newFormat);
		}
		return content.replace("\n", "<br>");
	}
	
	
	/**
	 * Returns a list with all links contained in the input
	 */
	public static List<String> extractUrls(String text)
	{
	    List<String> containedUrls = new ArrayList<String>();
	    String urlRegex = "((https?|ftp|gopher|telnet|file):((//)|(\\\\))+[\\w\\d:#@%/;$()~_?\\+-=\\\\\\.&]*)";
	    Pattern pattern = Pattern.compile(urlRegex, Pattern.CASE_INSENSITIVE);
	    Matcher urlMatcher = pattern.matcher(text);

	    while (urlMatcher.find())
	    {
	        containedUrls.add(text.substring(urlMatcher.start(0),
	                urlMatcher.end(0)));
	    }

	    return containedUrls;
	}

}	
