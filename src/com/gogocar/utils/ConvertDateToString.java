package com.gogocar.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ConvertDateToString {
	
	public static String NowDateToStr() {
		LocalDateTime datetime =LocalDateTime.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String str = datetime.format(format);
		return str;
	}
	
	public static Long dayDiff(String date1, String date2) {
		SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
		Long diff=0l;
		try {
			Long d1 = formater.parse(date1).getTime();
			Long d2 = formater.parse(date2).getTime();
			//diff=(Math.abs(d1-d2) / (1000 * 60 * 60 * 24));
			diff=(d1-d2)/(1000 * 60 * 60 * 24);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return diff;
	}

	
}
