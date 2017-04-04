package com.service;

import com.VO.CrawlerVo;

import java.util.List;

/**
 * Created by rong on 2017/4/4.
 */
public interface ICrawlerSearch {
    public List<CrawlerVo> findByName(String name);

    public void deleteAll();
}
