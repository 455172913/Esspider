package com.service;

import com.VO.CrawlerVo;
import com.domain.TeleplayDO;

import java.util.List;

/**
 * Created by rong on 2017/4/4.
 */
public interface ICrawlerSearch {
    public List<TeleplayDO> findByName(String name);

    public void deleteAll();

    public long getcount();
}
