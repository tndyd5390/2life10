package com.cl.util;
import java.text.DecimalFormat;

public class TextUtil {
	public static String exchangeEscape(String value){
		value = value.replaceAll("& lt;", "<").replaceAll("& gt;", ">");
        value = value.replaceAll("& #40;", "\\(").replaceAll("& #41;", "\\)");
        value = value.replaceAll("& #39;", "'");
        return value;
	}
	public static String replaceBr(String str){
		str = str.replaceAll("\n", "</br>");
		return str;
	}	
	public static String exchangeEscapeNvl(String value){
		value = CmmUtil.nvl(value);
		value = exchangeEscape(value);
		return value;
	}
	
	public static String addComma(int value){
		DecimalFormat df = new DecimalFormat("#,##0");
		return df.format(value);
	}
	
	public static String addComma(String value){
		return addComma(Integer.parseInt(value));
	}
}