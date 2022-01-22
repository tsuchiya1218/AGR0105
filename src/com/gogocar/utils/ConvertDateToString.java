package com.gogocar.utils;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.logging.SimpleFormatter;

public class ConvertDateToString {
	
	public static String NowDateToStr() {
		LocalDateTime datetime =LocalDateTime.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String str = datetime.format(format);
		return str;
	}
	
}
