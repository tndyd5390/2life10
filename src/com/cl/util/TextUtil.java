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
		return str.replaceAll("\n", "</br>");
	}	
	public static String exchangeEscapeNvl(String value){
		return exchangeEscape(CmmUtil.nvl(value));
	}
	
	public static String addComma(int value){
		return new DecimalFormat("#,##0").format(value);
	}
	
	public static String addComma(float value){
		return addComma((int)value);
	}
	
	public static String addComma(String value){
		String result = "";
		if(value.contains(".")){
			result = addComma(Float.parseFloat(value));
		}else{
			result = addComma(Integer.parseInt(value));
		}
		return result;
	}
	
	public static String getFileExtension(String fileName){
		fileName = CmmUtil.nvl(fileName);
		return fileName.substring(fileName.indexOf(".") + 1, fileName.length());
	}
}