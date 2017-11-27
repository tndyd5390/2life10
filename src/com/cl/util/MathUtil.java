package com.cl.util;

public class MathUtil {
	public static int[] range(int num, int range){
		int start;
		int end;
		int tmp = num;
		if(num%range == 0){
			return new int[] {num - range + 1, num};
		}
		while(tmp%range!=0){
			tmp++;
		}
		end = tmp;
		tmp = num;
		while(tmp%range!=0){
			tmp--;
		}
		start = ++tmp;
		return new int [] {start, end};
	}
}
