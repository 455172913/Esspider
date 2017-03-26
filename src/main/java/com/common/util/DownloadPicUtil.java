package com.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;

public class DownloadPicUtil {

	public static void download(String ul, String path) throws Exception {

		URL url   =   new URL(ul);
		URLConnection uc   =   url.openConnection();
		InputStream is   =   uc.getInputStream();
		File file = new File(path);
		if(!file.exists()){
			file.createNewFile();
		}

		int  j =0;                         
		FileOutputStream out =   new FileOutputStream(file);
		while   ((j=is.read())!=-1) {                                 
			out.write(j);                         
		}                        
		is.close();
	}

	public static void main(String[] args) {
		try {
			download("http://img3.douban.com/view/photo/photo/public/p2255040492.jpg", "E:/a.jpg");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
