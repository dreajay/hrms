package com.hrms.util;

import java.util.Calendar;
import java.util.Random;

public class UploadUtil {
	
	private static String savePath = "D:\\upload";
	
	public static String getSavePath() {
		return savePath;
	}
	
	public static String setFileName(String name) {
		Calendar c = Calendar.getInstance();
		c.get(Calendar.YEAR);
		c.get(Calendar.DAY_OF_MONTH);
		c.get(Calendar.HOUR_OF_DAY);
		c.get(Calendar.MINUTE);
		c.get(Calendar.MILLISECOND);
		String time = "" + c.get(Calendar.YEAR)+ (c.get(Calendar.MONTH)+1) + c.get(Calendar.DAY_OF_MONTH)
		+ c.get(Calendar.HOUR_OF_DAY) + c.get(Calendar.MINUTE) + c.get(Calendar.MILLISECOND);
		Random r = new Random();
		return time + "" + r.nextLong() + name;
	}
}
