package com.common.util;

import java.text.SimpleDateFormat;

/**
 * 
 * @Description 公共类
 * @time 下午2:53:03
 * @author Sun shinan
 */
public class Constant {

	/**
	 * 格式化时间为 yyyy-MM-dd
	 */
	public static final SimpleDateFormat YMD = new SimpleDateFormat("yyyy-MM-dd");
	/**
	 * 格式化时间为 yyyy-MM-dd HH:mm:ss
	 */
	public static final SimpleDateFormat YMDHMS = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	/**
	 * 格式化时间为 HH小时
	 */
	public static final SimpleDateFormat H = new SimpleDateFormat("HH");
	/**
	 * 格式化时间为 mm分
	 */
	public static final SimpleDateFormat m = new SimpleDateFormat("m");
	/**
	 * 一天的毫秒数
	 */
	public final static long ONE_DAY = 86400000l;
}
