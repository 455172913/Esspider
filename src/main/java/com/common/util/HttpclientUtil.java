package com.common.util;//package com.com.iminer.util;
//
//import java.io.IOException;
//import java.security.KeyManagementException;
//import java.security.KeyStoreException;
//import java.security.NoSuchAlgorithmException;
//import java.security.cert.CertificateException;
//import java.security.cert.X509Certificate;
//
//import javax.net.ssl.SSLContext;
//
//import org.apache.http.HttpEntity;
//import org.apache.http.HttpHost;
//import org.apache.http.HttpResponse;
//import org.apache.http.client.CookieStore;
//import org.apache.http.client.config.RequestConfig;
//import org.apache.http.client.methods.HttpGet;
//import org.apache.http.client.methods.HttpPost;
//import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
//import org.apache.http.conn.ssl.SSLContextBuilder;
//import org.apache.http.conn.ssl.TrustStrategy;
//import org.apache.http.impl.client.CloseableHttpClient;
//import org.apache.http.impl.client.HttpClientBuilder;
//import org.apache.http.impl.client.HttpClients;
//import org.apache.http.impl.conn.DefaultProxyRoutePlanner;
//import org.apache.http.util.EntityUtils;
//
///**
// * @time 下午5:54:14
// * @author DELL
// */
//public class HttpclientUtil {
//
//	public static final int CONNECT_TIMEOUT = 10* 1000;// 连接时间
//	public static final int READ_TIMEOUT = 60 * 1000;// 读1分钟秒超时
//
//	/**
//	 * 获取正文内容
//	 * @param url 请求地址
//	 * @param charset 字符集编码
//	 * @return
//	 */
//	public static String getContentGet(String url,String charset,String cookies){
//		//创建HttpClient  
//		CloseableHttpClient closeableHttpClient = HttpClientBuilder.create().build();  
//		//创建httpget 请求
//		HttpGet httpGet = new HttpGet(url);
//		//头部信息
//		System.out.println(httpGet.getRequestLine());
//		//创建字符串 接受返回内容
//		String content ="";
//		try {
//			//执行get请求
//			HttpResponse httpResponse = closeableHttpClient.execute(httpGet);
//			//获取响应消息实体
//			HttpEntity entity = httpResponse.getEntity();
//			//响应状态
//			//			System.out.println("status:"+httpResponse.getStatusLine());
//			//判断响应实体是否为空
//			if(entity != null){
//				content = EntityUtils.toString(entity,charset);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally{
//			try {
//				closeableHttpClient.close();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//		return content;
//	}
//
//	public static String getContentByGet(String url, String charset, String cookies, String ip, int host)
//	{
//		HttpHost proxy = new HttpHost(ip, host);
//		DefaultProxyRoutePlanner routePlanner = new DefaultProxyRoutePlanner(proxy);
//		CloseableHttpClient closeableHttpClient = HttpClients.custom().setRoutePlanner(routePlanner).build();
//
//		HttpGet httpGet = new HttpGet(url);
//
//		RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(10000).setConnectTimeout(10000).build();
//		
//		httpGet.setConfig(requestConfig);
//		httpGet.setHeader("User-Agent", "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)");
//
//		if (cookies != null)
//		{
//			httpGet.setHeader("cookie", cookies);
//		}
//
//		String content = "";
//		try
//		{
//			HttpResponse httpResponse = closeableHttpClient.execute(proxy, httpGet);
//
//			HttpEntity entity = httpResponse.getEntity();
//
//			if (entity != null)
//				content = EntityUtils.toString(entity, charset);
//		}
//		catch (Exception e) {
//			System.out.println("代理失效，换下一个代理");
//			try
//			{
//				closeableHttpClient.close();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//		finally
//		{
//			try
//			{
//				closeableHttpClient.close();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//		return content;
//	}
//
//	/**
//	 * 获取正文内容
//	 * @param url 请求地址
//	 * @param charset 字符集编码
//	 * @return
//	 */
//	public static String getContent(String url,String charset,String cookies){
//		//创建HttpClientBuilder  
//		HttpClientBuilder httpClientBuilder = HttpClientBuilder.create();  
//		//HttpClient  
//		CloseableHttpClient closeableHttpClient = httpClientBuilder.build();  
//		//创建httpget 请求
//		HttpPost httpPost = new HttpPost(url);
//		//头部信息
//		httpPost.setHeader("cookie", cookies);
//		//		System.out.println(httpPost.getRequestLine());
//		//创建字符串 接受返回内容
//		String content ="";
//		try {
//			//执行get请求
//			HttpResponse httpResponse = closeableHttpClient.execute(httpPost);
//			//获取响应消息实体
//			HttpEntity entity = httpResponse.getEntity();
//			//响应状态
//			//			System.out.println("status:"+httpResponse.getStatusLine());
//			//判断响应实体是否为空
//			if(entity != null){
//				content = EntityUtils.toString(entity,charset);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}finally{
//			try {
//				closeableHttpClient.close();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//		return content;
//	}
//
//	/**
//	 * httpclient4 绕过https证书验证方法
//	 * @return
//	 */
//	public static CloseableHttpClient createSSLClientDefault(RequestConfig globalConfig,CookieStore cookieStore ){
//		try {
//			SSLContext sslContext = new SSLContextBuilder().loadTrustMaterial(null, new TrustStrategy() {
//				@Override
//				public boolean isTrusted(X509Certificate[] chain,
//						String authType) throws CertificateException {
//					return true;
//				}
//			}).build();
//			SSLConnectionSocketFactory sslsf = new SSLConnectionSocketFactory(sslContext);
//			return HttpClients.custom().setDefaultRequestConfig(globalConfig).setDefaultCookieStore(cookieStore).setSSLSocketFactory(sslsf).build();
//		} catch (KeyManagementException e) {
//			e.printStackTrace();
//		} catch (NoSuchAlgorithmException e) {
//			e.printStackTrace();
//		} catch (KeyStoreException e) {
//			e.printStackTrace();
//		}
//		return  HttpClients.createDefault();
//	}
//}
