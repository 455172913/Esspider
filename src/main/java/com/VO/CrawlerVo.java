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
    private Integer id;

    private String name;

    private String domain;

    private String url;

    public CrawlerVo(Integer id, String name, String domain, String url) {
        this.id = id;
        this.name = name;
        this.domain = domain;
        this.url = url;
    }
    public CrawlerVo() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
