package com.common.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 文件读写公共类
 * @author ssn
 *
 */
public class FileUtil {

	public synchronized static Map<String, String> getMapFromFile(String path) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		BufferedReader br = new BufferedReader(new FileReader(new File(path)));
		String line = null;
		while((line = br.readLine()) != null){ 
			line =line.trim();
			map.put(line.substring(0,line.indexOf(",")), line.substring(line.indexOf(",")+1));
		}   
		br.close();  
		return map;
	}

	public synchronized static String getStringFromFile(String path) throws Exception {
		String result = "";
		BufferedReader br = new BufferedReader(new FileReader(new File(path)));
		String line = null;
		while((line = br.readLine()) != null){ 
			line =line.trim();
			result = result+ line+"\n";	
		}   
		br.close();  
		return result;
	}
	
	public synchronized static String getStringFromFile2(String path) throws Exception {
		String result = "";
		BufferedReader br = new BufferedReader(new FileReader(new File(path)));
		String line = null;
		while((line = br.readLine()) != null){ 
			line =line.trim();
			result = result+ "'"+line+"',";	
		}   
		br.close();  
		return result;
	}

	public synchronized static void setMapFromFile(String path, Map<String, String> map) throws Exception {
		BufferedReader br = new BufferedReader(new FileReader(new File(path)));
		String line = null;
		while((line = br.readLine()) != null){    
			map.put(line.substring(0,line.indexOf(",")), line.substring(line.indexOf(",")+1));
		}   
		br.close();  
	}

	/**
	 * 生成文件 若文件原有数据，就将新数据重新添加到最新行
	 * @param path 文件存储路径
	 * @param content 新数据
	 * @throws Exception
	 */
	public synchronized static void saveFile(String path, List<String> listAfter) throws Exception {
		List<String> list = new ArrayList<String>();
		File file = new File(path);
		if(!file.exists()){
			file.createNewFile();
		}

		BufferedReader br = new BufferedReader(new FileReader(file));
		String line = null;
		while((line = br.readLine()) != null){    
			list.add(line);   
		}   
		br.close();  
		list.addAll(listAfter);

		FileWriter fw = new FileWriter(file);
		for (int i = 0; i < list.size(); i++) {
			if(i==list.size()-1){
				fw.write(list.get(i));
			}else {
				fw.write(list.get(i)+"\n");
			}
		}
		fw.flush();
		fw.close();
	}

	/**
	 * 生成文件 若文件原有数据，就将新数据重新添加到最新行
	 * @param path 文件存储路径
	 * @param content 新数据
	 * @throws Exception
	 */
	public static void  saveFile(String path, String content) throws Exception {
		List<String> list = new ArrayList<String>();
		File file = new File(path);
		if(!file.exists()){
			file.createNewFile();
		}

		BufferedReader br = new BufferedReader(new FileReader(file));
		String line = null;
		while((line = br.readLine()) != null){    
			list.add(line);   
		}   
		br.close();  
		list.add(content);

		FileWriter fw = new FileWriter(file);
		for (int i = 0; i < list.size(); i++) {
			if(i==list.size()-1){
				fw.write(list.get(i));
			}else {
				fw.write(list.get(i)+"\n");
			}
		}
		fw.flush();
		fw.close();
	}


	public static String getAllFile(String path)throws Exception {
		String str = "";
		List<String> list = new ArrayList<String>();
		File file = new File(path);
		if(!file.exists()){
			file.createNewFile();
		}
		//将cookie文件信息全部读取到list集合中
		BufferedReader br = new BufferedReader(new FileReader(file));
		String line = null;
		while((line = br.readLine()) != null){    
			if(str==""){
				str = line;
			}else {
				str = str +","+line;
			}
		}   
		br.close();
		return str;
	}

	/**
	 * 操作cookie文件
	 * @param path
	 * @return
	 * @throws Exception
	 */
	public static String readCookies(String path) throws Exception {
		List<String> list = new ArrayList<String>();
		File file = new File(path);
		if(!file.exists()){
			file.createNewFile();
		}
		//将cookie文件信息全部读取到list集合中
		BufferedReader br = new BufferedReader(new FileReader(file));
		String line = null;
		while((line = br.readLine()) != null){    
			list.add(line);   
		}   
		br.close();  
		//将list集合的第一条数据付给cookies
		String cookies = list.get(0);
		//将剩下的数据重新写入cookies文件
		FileWriter fw = new FileWriter(file);
		for (int i = 1; i < list.size(); i++) {
			fw.write(list.get(i)+"\n");
		}
		//将第一条取出来的数据重新插入到文件尾部
		fw.write(cookies);
		fw.flush();
		fw.close();
		return cookies;
	}

}
