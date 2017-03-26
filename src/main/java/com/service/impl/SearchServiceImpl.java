package com.service.impl;

import com.service.ISearchService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by rong on 2017/3/26.
 */
@Service
public class SearchServiceImpl  implements ISearchService{
    @Resource
    private SearchHandler searchHandler;


    public Map search(String search_name){
        Map search_result = new HashMap();
        List youku_search_list = searchHandler.youkuHandler(search_name);
        List iqiyi_search_list = searchHandler.iqiyiHandler(search_name);
        List sohu_search_list = searchHandler.souhuHandler(search_name);
        List tengxun_search_list = searchHandler.tengxunHandler(search_name);
        search_result.put("youku_search_list" , youku_search_list);
        search_result.put("iqiyi_search_list" , iqiyi_search_list);
        search_result.put("sohu_search_list" , sohu_search_list);
        search_result.put("tengxun_search_list" , tengxun_search_list);
        return search_result;
    }

}
