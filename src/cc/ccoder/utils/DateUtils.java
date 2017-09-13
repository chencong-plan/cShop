package cc.ccoder.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

	private static final String FORMAT = "yyyy-MM-dd HH:mm:ss";

	public static String getCurrentTime(String format) {
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(format);
		return simpleDateFormat.format(date);
	}

	public static String getCurrentTime() {
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(FORMAT);
		return simpleDateFormat.format(date);
	}

}
