package com.gogocar.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class ConvertDateToString {
	
	public static String NowDateToStr() {
		LocalDateTime datetime =LocalDateTime.now();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		String str = datetime.format(format);
		return str;
	}
	
	public static Long dayDiff(String date1, String date2) {
		SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Long diff=0l;
		try {
			Long d1 = formater.parse(date1).getTime();
			Long d2 = formater.parse(date2).getTime();
			//diff=(Math.abs(d1-d2) / (1000 * 60 * 60 * 24));
			diff=(d1-d2)/(1000 * 60 * 60 );
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return diff;
	}
	
	public static String dateConvertion(String str) {
        Date parse = null;
        String dateString = "";
        try {
            parse = new SimpleDateFormat("yyyy/MM/dd").parse(str);
            dateString = new SimpleDateFormat("yyyy-MM-dd").format(parse);
        } catch (ParseException e) {
            dateString=null;
        }
        
        return dateString;
    }

	public static List<String> getBetweenDate(String startTime, String endTime){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
        // 声明保存日期集合
        List<String> list = new ArrayList<String>();
        try {
            // 转化成日期类型
            Date startDate = sdf.parse(startTime);
            Date endDate = sdf.parse(endTime);
 
            //用Calendar 进行日期比较判断
            Calendar calendar = Calendar.getInstance();
            while (startDate.getTime()<=endDate.getTime()){
                // 把日期添加到集合
                list.add(sdf.format(startDate));
                // 设置日期
                calendar.setTime(startDate);
                //把日期增加一天
                calendar.add(Calendar.DATE, 1);
                // 获取增加后的日期
                startDate=calendar.getTime();
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return list;
    }


	
}
