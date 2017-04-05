package com.VO;

import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;

import java.util.Date;

/**
 * Created by rong on 2017/4/3.
 */
@Document(indexName = "system", type = "crawler", shards = 1, replicas = 0, refreshInterval = "-1")
public class CrawlerVo {

    @Id
    private String  id;

    private String  name;
    private String domain;
    private String date;
    private String count;
    private Integer number;
    private String url;

    public CrawlerVo(String id, String name, String domain, String date, String count, Integer number) {
        this.id = id;
        this.name = name;
        this.domain = domain;
        this.date = date;
        this.count = count;
        this.number = number;
    }

    public CrawlerVo(){

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDomain() {
        return domain;
    }

    public void setDomain(String domain) {
        this.domain = domain;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public String getCount() {
        return count;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Integer getNumber() {
        return number;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
