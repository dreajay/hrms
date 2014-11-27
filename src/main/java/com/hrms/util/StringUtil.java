package com.hrms.util;

public class StringUtil {
	public static String getZhStr(String str,String charSet) {
		String temp = "";
		try {
			temp = new String(str.getBytes("ISO-8859-1"),charSet).trim();
		} catch (Exception e) {
			//System.out.println("my write exception:" + str + "is not correct");
		}
		return temp;
	}
	public static String getZhStr(String str) {
		String temp = "";
		try {
			temp = new String(str.getBytes("ISO-8859-1"),"UTF-8").trim();
		} catch (Exception e) {
			//System.out.println("my write exception:" + str + "is not correct");
		}
		return temp;
	}
	public static String getZhStr(String str,String getCharSet,String toCharSet) {
		String temp = "";
		try {
			temp = new String(str.getBytes(getCharSet),toCharSet).trim();
		} catch (Exception e) {
			//System.out.println("my write exception:" + str + "is not correct");
		}
		return temp;
	}
}
