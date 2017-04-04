package com.common.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

/**
 * Created by rong on 2017/4/4.
 */
public class DateUtil {
    public static final String DEFAULT_DATE_FORMAT = "yyyy-MM-dd";
    public static final String DATE_FORMAT_YYYYMM = "yyyy-MM";
    public static final String DATE_FORMAT_YYYYMMDD = "yyyyMMdd";
    public static final String DATE_FORMAT_YYYYMMDD_HHMM = "yyyy-MM-dd HH:mm";
    public static final String DATE_FORMAT_YYYYMMDDHHMMSS = "yyyyMMddHHmmss";
    public static final String DATE_FORMAT_YYYYMMDD_HHMMSS = "yyyy-MM-dd HH:mm:ss";
    public static final String DATE_FORMAT_YYYYMMDD_HHMMSS_SSS = "yyyy-MM-dd HH:mm:ss.SSS";
    public static final String DATE_FORMAT_YYYY_YEAR_MM_MONTH_DD_DAY_HH_HOUR_MM_MINUTE = "yyyy年MM月dd日HH时mm分";
    public static final String DATE_FORMAT_YYYYMMDD_WEEK_HHMM = "yyyy-MM-dd(E)HH:mm";
    public static final String DATE_FORMAT_HH = "HH";
    public static final int FMT_DATE_YYYY = 0;
    public static final int FMT_DATE_YYYYMMDD = 1;
    public static final int FMT_DATE_YYYYMMDD_HHMMSS = 2;
    public static final int FMT_DATE_HHMMSS = 3;
    public static final int FMT_DATE_HHMM = 4;
    public static final int FMT_DATE_SPECIAL = 5;
    public static final SimpleDateFormat yyMMddHHmmFormat = new SimpleDateFormat("yyMMddHHmm");

    public DateUtil() {
    }

    public static String obtainFormatDate(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }

    public static String obtainCurrentDate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
        return LocalDate.now().format(formatter);
    }

    public static Date addDays(Date date, int addedDays) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(5, addedDays);
        return cal.getTime();
    }

    public static int calculateIntDateByDistance(int intDay, int distance) {
        return calculateIntDateByDistance(intDay, distance, "yyyyMMdd");
    }

    public static int calculateIntDateByDistance(int intDay, int distance, String pattern) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);
        LocalDate localDate = LocalDate.parse(String.valueOf(intDay), formatter);

        return Integer.valueOf(formatter.format(localDate.plusDays(distance)));
    }

    public static Date addMonths(Date date, int addedMonths) {
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(2, addedMonths);
        return c.getTime();
    }

    public static int calculateAge(Date birth) {
        Calendar c = Calendar.getInstance();
        Calendar b = Calendar.getInstance();
        b.setTime(birth);
        int thisYear = c.get(1);
        int thisMonth = c.get(2);
        int thisDate = c.get(5);
        int birthYear = b.get(1);
        int birthMonth = b.get(2);
        int birthDate = b.get(5);
        return thisMonth < birthMonth?thisYear - birthYear - 1:(thisMonth > birthMonth?thisYear - birthYear:(thisDate < birthDate?thisYear - birthYear - 1:thisYear - birthYear));
    }

    public static int compareDate(Date date1, Date date2) {
        Calendar c1 = Calendar.getInstance();
        c1.setTime(date1);
        Calendar c2 = Calendar.getInstance();
        c2.setTime(date2);
        return c1.compareTo(c2);
    }

    public static String format(Date d, String format) {
        return d == null?null:(new SimpleDateFormat(format)).format(d);
    }

    public static String format(Timestamp time, String format) {
        return time == null?null:(new SimpleDateFormat(format)).format(time);
    }

    public static Date formatToDate(String date, String format) {
        try {
            if(null != date && !"".equalsIgnoreCase(date)) {
                SimpleDateFormat e = new SimpleDateFormat(format);
                return new Date(e.parse(date).getTime());
            } else {
                return null;
            }
        } catch (ParseException var3) {
            return null;
        }
    }

    public static Timestamp formatToTimestamp(String dateStr, String format) {
        try {
            SimpleDateFormat e = new SimpleDateFormat(format);
            return new Timestamp(e.parse(dateStr).getTime());
        } catch (ParseException var3) {
            return null;
        }
    }

    public static boolean isBetween(Date date, Date start, Date end) {
        return date != null && start != null && end != null?date.after(start) && date.before(end):false;
    }

    public static boolean isLastDayOfMonth(Date date) {
        if(date == null) {
            return false;
        } else {
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            int last = cal.getActualMaximum(5);
            int day = cal.get(5);
            return day == last;
        }
    }

    public static boolean isToday(Date date) {
        if(date == null) {
            return false;
        } else {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            return sdf.format(Calendar.getInstance().getTime()).equals(sdf.format(Long.valueOf(date.getTime())));
        }
    }

    public static Date getDate(int year, int month, int day) {
        return getDate(year, month, day, 0, 0, 0);
    }

    public static Date getDate(int year, int month, int day, int hour, int minute, int second) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month - 1, day, hour, minute, second);
        return calendar.getTime();
    }

    public static Timestamp getTimestamp(String str, String format) throws ParseException {
        SimpleDateFormat sorceFmt = new SimpleDateFormat(format);
        return new Timestamp(sorceFmt.parse(str).getTime());
    }

    public static int getDiffDays(Date begin, Date end) {
        return (int)(getDiffMinutes(begin, end) / 1440L);
    }

    public static long getDiffMinutes(Date begin, Date end) {
        return getDiffMsecs(begin, end) / 60000L;
    }

    public static long getDiffMsecs(Date begin, Date end) {
        return end.getTime() - begin.getTime();
    }

    public static int getYear(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        return cal.get(1);
    }

    public static int getMonth(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        return cal.get(2) + 1;
    }

    public static int getDay(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        return cal.get(5);
    }

    public static int getWeek(Date date) {
        Calendar current = Calendar.getInstance();
        current.setTime(date);
        return current.get(7);
    }

    public static String getWeekStr(Timestamp time) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(time);
        int result = cal.get(7);
        String weekDay = "";
        switch(result) {
            case 1:
                weekDay = "星期日";
                break;
            case 2:
                weekDay = "星期一";
                break;
            case 3:
                weekDay = "星期二";
                break;
            case 4:
                weekDay = "星期三";
                break;
            case 5:
                weekDay = "星期四";
                break;
            case 6:
                weekDay = "星期五";
                break;
            case 7:
                weekDay = "星期六";
        }

        return weekDay;
    }

    public static Timestamp getYesterday() {
        return new Timestamp(addDays(new Date(), -1).getTime());
    }

    public static Timestamp getCurrentTimestamp() {
        return new Timestamp(System.currentTimeMillis());
    }

    public static Timestamp getIntervalTimestampBySeconds(Timestamp ts, long seconds) {
        return new Timestamp(ts.getTime() + seconds * 1000L);
    }

    public static Timestamp getIntervalTimestampByDays(Timestamp ts, long days) {
        return getIntervalTimestampBySeconds(ts, days * 86400L);
    }

    public static Timestamp getBeginOfToday() {
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd");
        String dateStr = form.format(cal.getTime()) + " 00:00:00";
        Date date = null;

        try {
            date = form.parse(dateStr);
        } catch (ParseException var5) {
            return null;
        }

        return new Timestamp(date.getTime());
    }

    public static Timestamp getBeginOfOneHour(Timestamp times) {
        SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd HH");
        String dateStr = form.format(Long.valueOf(times.getTime())) + ":00:00";
        Date date = null;

        try {
            date = form.parse(dateStr);
        } catch (ParseException var5) {
            return null;
        }

        return new Timestamp(date.getTime());
    }

    public static Timestamp getBeginOfOneDay(Timestamp times) {
        SimpleDateFormat formDate = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat formTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateStr = formDate.format(Long.valueOf(times.getTime())) + " 00:00:00";
        Date date = null;

        try {
            date = formTime.parse(dateStr);
        } catch (ParseException var6) {
            return null;
        }

        return new Timestamp(date.getTime());
    }

    public static Timestamp getEndOfOneDay(Timestamp times) {
        SimpleDateFormat formDate = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat formTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateStr = formDate.format(Long.valueOf(times.getTime())) + " 23:59:59";
        Date date = null;

        try {
            date = formTime.parse(dateStr);
        } catch (ParseException var6) {
            return null;
        }

        return new Timestamp(date.getTime());
    }

    public static String formatCommonDate(Date date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(date);
    }

    public static String formatCommonDateDay(Date date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormat.format(date);
    }

    public static String formatSimpleDateDay(Date date) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        return dateFormat.format(date);
    }

    public static String currentSimpleDateDay() {
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
        return dateFormat.format(currentDate);
    }

    public static Integer currentDateInt() {
        return Integer.valueOf(currentSimpleDateDay());
    }

    public static String currentDate() {
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormat.format(currentDate);
    }

    public static String currentSimpleDate() {
        Date currentDate = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        return dateFormat.format(currentDate);
    }

    public static String getFormatDateByDateSeconds(long seconds) {
        Date currentDate = new Date(seconds * 1000L);
        return formatCommonDate(currentDate);
    }

    public static String yyMMddHHmmFormatDate() {
        Date currentDate = new Date();
        return yyMMddHHmmFormat.format(currentDate);
    }


}

