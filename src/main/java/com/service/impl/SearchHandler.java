package com.service.impl;

import com.common.util.CrawlerUtils;
import com.common.util.HttpsGetData;
import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import com.gargoylesoftware.htmlunit.WebClient;
import com.model.SearchModel;
import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by rong on 2017/3/26.
 */
@Service
public class SearchHandler {
    @Value("${youku_search_url}")
    private String youku_search_url;

    @Value("${iqiyi_search_url}")
    private String iqiyi_search_url;

    @Value("${souhu_search_url}")
    private String souhu_search_url;

    @Value("${tengxun_search_url}")
    private String tengxun_search_url;

    public List youkuHandler(String search_name ){
        List youku_search_list = new ArrayList();
        String url = youku_search_url;
        url = url.replace("SEARCH_NAME",search_name);
        WebClient client = CrawlerUtils.getClient();
        String content = null;
        try {
            System.out.println(url);
            content = client.getPage(url).getWebResponse().getContentAsString();
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
        Elements root=document.select("div.DIR div.s_dir");
        for (Element element : root){
            Elements ele_name = element.select("div.s_detail h2.base_name");
            Elements ele_url = element.select("div.s_detail h2.base_name a");
            String youku_play_url = ele_url.attr("href");
            String youku_img_url = element.select("div.s_target img").attr("src");
            if (youku_play_url.contains("detail")){
                youku_play_url = "http://www.soku.com"+youku_play_url;
            }
            String youku_name = ele_name.text();
            SearchModel searchModel = new SearchModel();
            searchModel.setDomain("youku.com");
            searchModel.setName(youku_name);
            searchModel.setImg_url(youku_img_url);
            searchModel.setPlay_url(youku_play_url);
            youku_search_list.add(searchModel);
//            System.out.println(name);
//            System.out.println(youku_play_url);
//            System.out.println(youku_img_url);
        }
        return youku_search_list;
    }

    public List iqiyiHandler(String search_name ){
        List iqiyi_search_list = new ArrayList();
//        String url = "http://so.iqiyi.com/so/q_SEARCH_NAME";
        String url = iqiyi_search_url;
        url = url.replace("SEARCH_NAME",search_name);
        WebClient client = CrawlerUtils.getClient();
        String content = null;
        try {
            content = client.getPage(url).getWebResponse().getContentAsString();
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
        Elements root = document.select("ul.mod_result_list li.list_item");
        for (Element element : root){
            Elements ele_infos = element.select("div[class=result_info result_info-auto result_info-180236]");
            if (!StringUtils.isEmpty(ele_infos.toString())){
                Elements ele_imgs = element.select("a img");
                Elements ele_name = ele_infos.select("h3.result_title a");

                String iqiyi_name = ele_name.attr("title");
                String iqiyi_play_url = ele_name.attr("href");
                String iqiyi_img = ele_imgs.attr("src");

                SearchModel searchModel = new SearchModel();
                searchModel.setDomain("iqiyi.com");
                searchModel.setName(iqiyi_name);
                searchModel.setImg_url(iqiyi_img);
                searchModel.setPlay_url(iqiyi_play_url);
                iqiyi_search_list.add(searchModel);
                System.out.println(iqiyi_name);
                System.out.println(iqiyi_play_url);
                System.out.println(iqiyi_img);
            }
        }
        return iqiyi_search_list;
    }

    public List souhuHandler(String search_name ){
        List souhu_search_list = new ArrayList();
//        String url = "http://so.tv.sohu.com/mts?wd=SEARCH_NAME";
        String url = souhu_search_url;
        WebClient client = CrawlerUtils.getClient();
        String content = null;
        String temp_name = URLEncoder.encode(search_name);
        url = url.replace("SEARCH_NAME",temp_name);
        try {
            content = client.getPage(url).getWebResponse().getContentAsString();

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
        Elements root=document.select("div[class = ssItem cfix]");
        for (Element element : root){
            Elements ele_info = element.select("div.center h2 a" );
            String souhu_name = ele_info.attr("title");
            String souhu_play_url = "http:" + ele_info.attr("href");
            String souhu_img_url = "http:" + element.select("div.pic img").attr("src");

            SearchModel searchModel = new SearchModel();
            searchModel.setDomain("souhu.com");
            searchModel.setName(souhu_name);
            searchModel.setImg_url(souhu_img_url);
            searchModel.setPlay_url(souhu_play_url);
            souhu_search_list.add(searchModel);
//            System.out.println( souhu_name + souhu_play_url);
//            System.out.println(souhu_img_url);
        }
        return souhu_search_list;
    }

    public List tengxunHandler(String search_name ){
        List tengxun_search_list = new ArrayList();
//        String url = "https://v.qq.com/x/search/?q=SEARCH_NAME";
        String url = tengxun_search_url;
        String ss = URLEncoder.encode(search_name);
        url = url.replace("SEARCH_NAME",ss);
        String content = null;
        try {
            content = new HttpsGetData(url,null).Do();
        } catch (Exception e) {
            e.printStackTrace();
        }
        Document document= Jsoup.parse(content);
//        System.out.println(content);
        Elements root=document.select("div[class=_infos]");
        for (Element element : root){
            Elements ele_name = element.select("h2 a");
            Elements ele_img = element.select("a img");

            String tengxun_name = ele_name.text();
            String tengxun_play_url = ele_name.attr("href");
            String tengxun_img_url = "http:" + ele_img.attr("src");

            SearchModel searchModel = new SearchModel();
            searchModel.setDomain("qq.com");
            searchModel.setName(tengxun_name);
            searchModel.setImg_url(tengxun_img_url);
            searchModel.setPlay_url(tengxun_play_url);
            tengxun_search_list.add(searchModel);
//            System.out.println(tengxun_name + tengxun_play_url);
//            System.out.println(tengxun_img_url);
        }
        return  tengxun_search_list;
    }
}
