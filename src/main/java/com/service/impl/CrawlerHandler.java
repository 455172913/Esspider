package com.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.common.util.DateUtil;
import com.common.util.HttpsGetData;
import com.dao.TeleplayDOMapper;
import com.domain.TeleplayDO;
import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.Page;
import com.gargoylesoftware.htmlunit.RefreshHandler;
import com.gargoylesoftware.htmlunit.WebClient;
import com.repository.CrawlerRepository;
import com.service.ICrawlerSearch;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by rong on 2017/4/2.
 */
@Service
@Component
@Configurable
@EnableScheduling
public class CrawlerHandler {
    @Value("${youku_search_url}")
    private String youku_crawler_url;
    @Value("${souhu_crawler_url}")
    private String souhu_crawler_url;
    @Value("${douban_crawler_url}")
    private String douban_crawler_url;


    @Resource
    ICrawlerSearch crawlerSearch;

    @Resource
    CrawlerRepository crawlerRepository;

    @Resource
    TeleplayDOMapper teleplayDOMapper;
    private static int counter = 0;

    @Scheduled(cron = "1 30 14 * * ?")
    protected void execute() {
        youkuCrawler();
        souhuCrawler();
        doubanCrawler();
    }

    public void youkuCrawler(){
        String url = youku_crawler_url;
        WebClient webClient = new WebClient();
        webClient.getOptions().setJavaScriptEnabled(false);
        webClient.getOptions().setCssEnabled(false);
        webClient.getOptions().setAppletEnabled(false);
        webClient.setRefreshHandler(new RefreshHandler() {
            public void handleRefresh(Page page, URL url, int seconds) throws IOException {
            }
        });
        webClient.addRequestHeader("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13");

        String content = null;
        try {
            Page page = webClient.getPage(url);
            content =  page.getWebResponse().getContentAsString();

        } catch (FailingHttpStatusCodeException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        Document document= Jsoup.parse(content);
        Elements root=document.select("div.box-series ul.panel li[class=yk-col4 mr1]");
        for (int i = 0; i<root.size();i++){
            Elements ele_name = null;
            Element ele_count = null;
            try {
                Element element = root.get(i);
                Elements ele_info = element.select("ul.info-list");
                ele_name = ele_info.select("li.title a");
                ele_count = ele_info.select("li").get(2);
            } catch (Exception e) {
                e.printStackTrace();
            }
            String youku_play_url = "http:"+ele_name.attr("href");
            String youku_name = ele_name.attr("title");
            String youku_count = ele_count.text();
            System.out.println(" hhh "+youku_name + youku_play_url);
            System.out.println( youku_count);
            TeleplayDO teleplayDO = new TeleplayDO();
            teleplayDO.setName(youku_name);
            teleplayDO.setDomain("youku.com");
            teleplayDO.setUrl(youku_play_url);
            teleplayDO.setCount(youku_count);
            teleplayDO.setNumber(i+1);
            teleplayDO.setUpdatedate(DateUtil.format(new Date(),"yyyy-MM-dd"));
            teleplayDO.setUpdatetime(System.currentTimeMillis());
            TeleplayDO temp = teleplayDOMapper.selectByUrl(youku_play_url);
            if (temp != null){
                teleplayDO.setId(temp.getId());
                teleplayDO.setInsertdate(temp.getInsertdate());
                teleplayDO.setInserttime(temp.getInserttime());
                teleplayDOMapper.updateByPrimaryKey(teleplayDO);
            }else {
                teleplayDO.setInsertdate(DateUtil.format(new Date(),"yyyy-MM-dd"));
                teleplayDO.setInserttime(System.currentTimeMillis());
                teleplayDOMapper.insert(teleplayDO);
            }
        }
    }

    public void souhuCrawler(){
        String url = souhu_crawler_url;
        WebClient webClient = new WebClient();
        webClient.getOptions().setJavaScriptEnabled(true);
        webClient.getOptions().setCssEnabled(false);
        webClient.getOptions().setAppletEnabled(false);
        webClient.setRefreshHandler(new RefreshHandler() {
            public void handleRefresh(Page page, URL url, int seconds) throws IOException {
            }
        });
        webClient.addRequestHeader("User-Agent", "Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13");

        String content = null;
        try {
            Page page = webClient.getPage(url);
            content =  page.getWebResponse().getContentAsString();
        } catch (FailingHttpStatusCodeException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        Document document= Jsoup.parse(content);
        Element root = document.select("div.rList_subCon").get(0);
        Elements days = root.select("ul[class=rList] li");
        for (int i = 0; i<days.size();i++){
            Elements ele_name = null;
            Elements ele_count = null;
            try {
                Element element = days.get(i);
                ele_name = element.select("div.vName a");
                ele_count = element.select("span.vTotal");
            } catch (Exception e) {
                e.printStackTrace();
            }
            String souhu_name = ele_name.attr("title");
            String souhu_play_url = ele_name.attr("href");
            String souhu_count = ele_count.text();
            TeleplayDO teleplayDO = new TeleplayDO();
            teleplayDO.setName(souhu_name);
            teleplayDO.setDomain("souhu.com");
            teleplayDO.setUrl(souhu_play_url);
            teleplayDO.setCount(souhu_count);
            teleplayDO.setNumber(i+1);
            teleplayDO.setUpdatedate(DateUtil.format(new Date(),"yyyy-MM-dd"));
            teleplayDO.setUpdatetime(System.currentTimeMillis());
            TeleplayDO temp = teleplayDOMapper.selectByUrl(souhu_play_url);
            if (temp != null){
                teleplayDO.setId(temp.getId());
                teleplayDO.setInsertdate(temp.getInsertdate());
                teleplayDO.setInserttime(temp.getInserttime());
                teleplayDOMapper.updateByPrimaryKey(teleplayDO);
            }else {
                teleplayDO.setInsertdate(DateUtil.format(new Date(),"yyyy-MM-dd"));
                teleplayDO.setInserttime(System.currentTimeMillis());
                teleplayDOMapper.insert(teleplayDO);
            }
            System.out.println(souhu_name + ":" +souhu_count);
            System.out.println(souhu_play_url);
        }
    }

    public void doubanCrawler(){
        String url = douban_crawler_url;
        String content = null;
        try {
            content = new HttpsGetData(url,null).Do();
        } catch (Exception e) {
            e.printStackTrace();
        }
        Document document= Jsoup.parse(content);
        JSONObject root = JSONObject.parseObject(content);
        JSONArray jsonArray = root.getJSONArray("subjects");

        for (int i = 0 ; i< jsonArray.size(); i++){
            JSONObject jsonObject = jsonArray.getJSONObject(i);
            String rate = jsonObject.getString("rate");
            String title = jsonObject.getString("title");
            String douban_url = jsonObject.getString("url");
            TeleplayDO teleplayDO = new TeleplayDO();
            teleplayDO.setName(title);
            teleplayDO.setDomain("douban.com");
            teleplayDO.setUrl(douban_url);
            teleplayDO.setRate(rate);
            teleplayDO.setUpdatedate(DateUtil.format(new Date(),"yyyy-MM-dd"));
            teleplayDO.setUpdatetime(System.currentTimeMillis());
            TeleplayDO temp = teleplayDOMapper.selectByUrl(douban_url);
            if (temp != null){
                teleplayDO.setId(temp.getId());
                teleplayDO.setInsertdate(temp.getInsertdate());
                teleplayDO.setInserttime(temp.getInserttime());
                teleplayDOMapper.updateByPrimaryKey(teleplayDO);
            }else {
                teleplayDO.setInsertdate(DateUtil.format(new Date(),"yyyy-MM-dd"));
                teleplayDO.setInserttime(System.currentTimeMillis());
                teleplayDOMapper.insert(teleplayDO);
            }

        }
    }
}
