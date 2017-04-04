package com.service.impl;

import com.VO.CrawlerVo;
import com.common.util.DateUtil;
import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.Page;
import com.gargoylesoftware.htmlunit.RefreshHandler;
import com.gargoylesoftware.htmlunit.WebClient;
import com.repository.CrawlerRepository;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
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
@Component("testJobComponent")
public class CrawlerHandler implements Job{
    @Resource
    CrawlerRepository crawlerRepository;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        youkuCrawler();
    }

    public void youkuCrawler(){
        String url = "http://tv.youku.com";
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
        Elements root=document.select("div.yk-body div[class=yk-rank yk-rank-long] div.item");
        for (Element element : root){
            Elements ele_info = element.select("a");
            Elements ele_count = element.select("span");
            Elements ele_number = element.select("label");
            String youku_play_url = ele_info.attr("href");
            String youku_name = ele_info.text();
            String youku_count = ele_count.text();
            String youku_number = ele_number.text();
            System.out.println( youku_number + " hhh "+youku_name + youku_play_url);
            System.out.println( youku_count);
            CrawlerVo crawlerVo = new CrawlerVo();
            crawlerVo.setName(youku_name);
            crawlerVo.setDomain("youku.com");
            crawlerVo.setCount(youku_count);
            crawlerVo.setDate(DateUtil.format(new Date(),"yyyy-MM-dd"));
            crawlerRepository.save(crawlerVo);
        }
    }
}
