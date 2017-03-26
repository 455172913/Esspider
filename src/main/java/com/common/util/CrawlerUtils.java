package com.common.util;

import com.gargoylesoftware.htmlunit.*;
import com.gargoylesoftware.htmlunit.html.HTMLParser;
import com.gargoylesoftware.htmlunit.util.NameValuePair;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;

import javax.script.Invocable;
import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import java.io.FileReader;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * ClassName:Crawler4all Description:
 * 
 * @author sunshinan
 * @Date 2012 2012-6-26 上午11:00:33
 */
public class CrawlerUtils {


	// 生成随机数用于sleep
	static List<Long> randomList = null;

	static {
		randomList = getRandomList();
	}

	/**
	 * 生成随机数用于sleep
	 * 
	 * @return 设定文件
	 */
	private static List<Long> getRandomList() {
		if(randomList == null) {
			randomList = new ArrayList<Long>();

			for(int i = 2001; i <= 5000; i++) {
				long num = (long)(i + Math.random() * 3000);
				randomList.add(num);
			}
		}

		return randomList;
	}


	/**
	 * 使用webclient 捕获JS抓取
	 */
	public static WebClient getClientWithJS() {
		WebClient client = new WebClient();
		client.getOptions().setJavaScriptEnabled(true);
		client.getOptions().setCssEnabled(false);
		client.setAjaxController(new NicelyResynchronizingAjaxController());  
		client.getOptions().setThrowExceptionOnScriptError(false);
		return client;
	}

	/**
	 * 使用webclient 无JS 抓取
	 */
	public static WebClient getClient() {
		WebClient webClient = new WebClient();
		webClient.getOptions().setJavaScriptEnabled(false);
		webClient.getOptions().setCssEnabled(false);
		webClient.getOptions().setAppletEnabled(false);
		
		
//		webClient.addRequestHeader("X-Requested-With", "XMLHttpRequest");
	
	
		webClient.setRefreshHandler(new RefreshHandler() {

			@Override
			public void handleRefresh(Page page, URL url, int seconds) throws IOException {

			}
		});
		webClient.addRequestHeader("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13");
	//    webClient.addRequestHeader("Referer", "https://dianying.taobao.com/showDetail.htm?spm=a1z21.6646273.w2.3.BapRNR&showId=35237&n_s=new&source=current");
	    return webClient;
	}

	/**
	 * 正则匹配取出source中想要取得的部分
	 * 
	 * @param regex 正则表达式
	 * @param source 要抽取的源字符串
	 * @param flag 取出数据时matcher.group(flag)中flag参数
	 * @param isFirst 标记是否取第一个匹配的
	 */
	public static String getMatchString(String regex, String source, int flag, boolean isFirst) {
		Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(source);

		String result = null;
		while(m.find()) {
			result = flag > 0 ? m.group(flag) : m.group();
			if(isFirst) {
				return result;
			}
		}

		return result;
	}



	// 获取随机数用于sleep
	public static long getRandom() {
		long randomLong = randomList.get(new Random().nextInt(3000)) / 6;
		return randomLong;
	}

	/**
	 * 取得n位的随机数组成的字符串
	 */
	public static String getRandomNum(int n) {
		if(n < 1) {
			return "0";
		} else {
			StringBuffer sb = new StringBuffer();
			for(int i = 1; i <= n; i++) {
				double rand = Math.random();
				int random = (int)(rand * 10);
				sb.append(random);
			}

			return sb.toString();
		}
	}

	/**
	 * 去除集合中重复数据
	 * 
	 * @param outgoingUrls 要操作的url集合
	 */
	public static void deleteRepeated(List<String> outgoingUrls) {
		Set<String> set = new HashSet<String>(outgoingUrls);
		outgoingUrls.clear();
		outgoingUrls.addAll(set);

		set.clear();
	}

	/**
	 * 取得总页数
	 * 
	 * @param recordCount 总的评论页数
	 * @param pageSize 每页显示页数
	 * @return pageNums 总页数
	 */
	public static int getPageNum(int recordCount, int pageSize) {
		int size = recordCount / pageSize;
		int mod = recordCount % pageSize;
		if(mod != 0)
			size++;

		return recordCount == 0 ? 1 : size;
	}



	/**
	 * 中文轉Unicode
	 */
	public static String toUnicode(String s) {
		StringBuilder sb = new StringBuilder();
		for(int i = 0; i < s.length(); i++) {
			if(s.charAt(i) <= 256) {
				sb.append("\\u00");
			} else {
				sb.append("\\u");
			}
			sb.append(Integer.toHexString(s.charAt(i)));
		}
		return sb.toString();
	}

	/**
	 * @Description ipprDecode 解码 用于按明星名字搜索 百度图片url
	 * @param url 解码前url
	 * @return 解码后字符串
	 */
	public static String ipprDecode(String url) {

		String decodeString = null;
		ScriptEngineManager manager = new ScriptEngineManager();
		ScriptEngine engine = manager.getEngineByName("javascript");
		// 是要执行的JS内容
		try {
			FileReader reader = new FileReader("./conf/ipprDecode.js");

			engine.eval(reader);
			if(engine instanceof Invocable) {
				Invocable invoke = (Invocable)engine;

				// 调用js中的sdecodeHTML方法，并传入参数(多个参数可传)
				decodeString = (String)invoke.invokeFunction("ipprDecode", url);
			}
			reader.close();

		} catch(Exception e) {
			e.printStackTrace();
		}

		return decodeString;
	}

	/**
	 * 通过html构造driver
	 * 
	 * @param html
	 * @return
	 */
	public static HtmlUnitDriver getDriver(final String html) {
		HtmlUnitDriver driver = new HtmlUnitDriver(BrowserVersion.FIREFOX_38) {

			@Override
			protected WebClient modifyWebClient(WebClient client1) {

				WebClient client = new WebClient();
				client.setRefreshHandler(new RefreshHandler() {

					@Override
					public void handleRefresh(Page arg0, URL arg1, int arg2) throws IOException {

					}
				});
				client.getOptions().setTimeout(60 * 1000);
				// 禁止解析css
				client.getOptions().setCssEnabled(false);
				client.getOptions().setJavaScriptEnabled(false);
				super.modifyWebClient(client);
				try {
					long time = System.currentTimeMillis();
					String url = "http://iminerLocalhost" + time + ".com";
					client.initialize(HTMLParser.parseHtml(new StringWebResponse(html, new URL(url)), client.getCurrentWindow()));
					client.getOptions().setHomePage(url);
				} catch(MalformedURLException e) {
					e.printStackTrace();
				} catch(IOException e) {
					e.printStackTrace();
				}
				return client.getCurrentWindow().getWebClient();
			}
		};
		driver.manage().timeouts().implicitlyWait(1, TimeUnit.SECONDS);
		driver.manage().timeouts().setScriptTimeout(10, TimeUnit.SECONDS);
		driver.setJavascriptEnabled(false);

		return driver;
	}

	/**
	 * 执行javaScript语句,可以多行,取result的值
	 * 
	 * @param js 代码
	 * @return result变量的值
	 */
	public static String execJs(String js) {

		String decodeString = null;
		ScriptEngineManager manager = new ScriptEngineManager();
		ScriptEngine engine = manager.getEngineByName("javascript");
		// 是要执行的JS内容
		try {
			engine.eval(js);
			decodeString = engine.get("result").toString();
		} catch(Exception e) {
			e.printStackTrace();
		}

		return decodeString;
	}
	
	/**
	 * 调用js方法 获取返回值
	 * 
	 * @param js js文件的string形式
	 * @param functionName 调用函数名
	 * @param o 参数 Object ... 类型
	 * @return 该函数执行结果
	 * @throws ScriptException
	 */
	public static String execJs(String js, String functionName, Object...o) throws ScriptException {
		ScriptEngineManager manager = new ScriptEngineManager();
		ScriptEngine engine = manager.getEngineByName("javascript");
		engine.eval(js);
		String result = "";
		if(engine instanceof Invocable) {
			Invocable invoke = (Invocable)engine;
			// 调用preprocess方法，并传入参数密码和验证码
			try {
				result = invoke.invokeFunction(functionName, o).toString();
			} catch(NoSuchMethodException e) {
				e.printStackTrace();
			}
		}
		return result;
	}

	/**
	 * unicode转为汉字
	 * 
	 * @param s
	 * @return
	 */
	public static String toUnicodeString(String s) {
		StringBuffer sb = new StringBuffer();
		for(int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			if(c >= 0 && c <= 255) {
				sb.append(c);
			} else {
				sb.append("\\u" + Integer.toHexString(c));
			}
		}
		return sb.toString();
	}

	
	public static Page getPageByPost(WebClient webClient, List<NameValuePair> pairList, String url){
		Page page =null;
		try {
			WebRequest request = new WebRequest(new URL(url), HttpMethod.POST);
			request.setRequestParameters(pairList);
			request.setCharset("UTF-8");
			page = webClient.getPage(request);

		} catch (MalformedURLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (FailingHttpStatusCodeException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (RuntimeException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		return page;

	}

}
