package com.service;

import com.domain.TeleplayDO;

import java.util.List;
import java.util.Map;

/**
 * Created by rong on 2017/3/26.
 */
public interface ISearchService {
    public Map search(String search_name,Integer type);

    public List detail(Integer type);
}
