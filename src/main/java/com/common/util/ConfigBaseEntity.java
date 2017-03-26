package com.common.util;

/**
 * @Description  
 * @time 2015年8月18日
 * @author Sun shinan
 */
public class ConfigBaseEntity {
	private String ip;
	private int port;
	private long timesout;
	private long sendcounts;
	private long sendtimes;
	private String type;
	
	/**
	 * @param ip
	 * @param port
	 * @param timesout
	 * @param sendcounts
	 * @param sendtimes
	 * @param type
	 */
	public ConfigBaseEntity(String ip, int port, long timesout,
                            long sendcounts, long sendtimes, String type) {
		super();
		this.ip = ip;
		this.port = port;
		this.timesout = timesout;
		this.sendcounts = sendcounts;
		this.sendtimes = sendtimes;
		this.type = type;
	}
	
	
}
