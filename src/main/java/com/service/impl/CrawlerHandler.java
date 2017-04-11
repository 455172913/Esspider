package com.service.impl;

import com.common.util.DateUtil;
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
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Date;

/**
 * Created by rong on 2017/4/2.
 */
@Service
@Component
@Configurable
@EnableScheduling
public class CrawlerHandler {
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
    }

    public void youkuCrawler(){
        String url = "http://list.youku.com/category/show/c_97_a__s_1_d_1.html.html";
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

//        Document document= Jsoup.parse(content);
//        Elements root=document.select("div.yk-body div[class=yk-rank yk-rank-long] div.item");
//        for (Element element : root){
//            Elements ele_info = element.select("a");
//            Elements ele_count = element.select("span");
//            Elements ele_number = element.select("label");
//            String youku_play_url = ele_info.attr("href");
//            String youku_name = ele_info.text();
//            String youku_count = ele_count.text();
//            String youku_number = ele_number.text();
//            System.out.println( youku_number + " hhh "+youku_name + youku_play_url);
//            System.out.println( youku_count);
//            CrawlerVo crawlerVo = new CrawlerVo();
//            crawlerVo.setName(youku_name);
////            crawlerVo.setId("1");
//            crawlerVo.setDomain("youku.com");
//            crawlerVo.setUrl(youku_play_url);
//            crawlerVo.setCount(youku_count);
//            crawlerVo.setDate(DateUtil.format(new Date(),"yyyy-MM-dd"));
//            crawlerRepository.save(crawlerVo);
//        }

        Document document= Jsoup.parse(content);
        Elements root=document.select("div.box-series ul.panel li[class=yk-col4 mr1]");
        for (int i = 0; i<root.size();i++){
            Element element = root.get(i);
            Elements ele_info = element.select("ul.info-list");
            Elements ele_name = ele_info.select("li.title a");
            Element ele_count = ele_info.select("li").get(2);
            String youku_play_url = "http:"+ele_name.attr("href");
            String youku_name = ele_name.attr("title");
            String youku_count = ele_count.text();
            System.out.println(" hhh "+youku_name + youku_play_url);
            System.out.println( youku_count);
            TeleplayDO teleplayDO = new TeleplayDO();
            teleplayDO.setName(youku_name);
//            teleplayDO.setId(String.valueOf(crawlerSearch.getcount()+1));
            teleplayDO.setDomain("youku.com");
            teleplayDO.setUrl(youku_play_url);
            teleplayDO.setCount(youku_count);
            teleplayDO.setDate(DateUtil.format(new Date(),"yyyy-MM-dd"));
            teleplayDO.setNumber(i+1);
            teleplayDOMapper.insert(teleplayDO);
            try {
                Thread.sleep(1000*1);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    public void souhuCrawler(){
        String url = "http://tv.sohu.com/rank/china_tv.shtml";
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
            Element element = days.get(i);
            Elements ele_name = element.select("div.vName a");
            Elements ele_count = element.select("span.vTotal");
            String souhu_name = ele_name.attr("title");
            String souhu_play_url = ele_name.attr("href");
            String souhu_count = ele_count.text();
            TeleplayDO teleplayDO = new TeleplayDO();
            teleplayDO.setName(souhu_name);
//            teleplayDO.setId(String.valueOf(crawlerSearch.getcount()+1));
            teleplayDO.setDomain("souhu.com");
            teleplayDO.setUrl(souhu_play_url);
            teleplayDO.setCount(souhu_count);
            teleplayDO.setDate(DateUtil.format(new Date(),"yyyy-MM-dd"));
            teleplayDO.setNumber(i+1);
            teleplayDOMapper.insert(teleplayDO);
            System.out.println(souhu_name + ":" +souhu_count);
            System.out.println(souhu_play_url);
            try {
                Thread.sleep(1000*1);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }
}
