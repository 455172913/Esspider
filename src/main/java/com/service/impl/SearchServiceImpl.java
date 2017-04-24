package com.service.impl;

import com.common.util.DateUtil;
import com.dao.TeleplayDOMapper;
import com.domain.TeleplayDO;
import com.service.ISearchService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * Created by rong on 2017/3/26.
 */
@Service
public class SearchServiceImpl  implements ISearchService{
    @Resource
    private SearchHandler searchHandler;

    @Resource
    TeleplayDOMapper teleplayDOMapper;


    public Map search(String search_name,Integer type){
        Map search_result = new HashMap();
        List youku_search_list = searchHandler.youkuHandler(search_name);
        List iqiyi_search_list = searchHandler.iqiyiHandler(search_name);
        List sohu_search_list = searchHandler.souhuHandler(search_name);
        List tengxun_search_list = searchHandler.tengxunHandler(search_name);
//        search_result.put("youku_search_list" , youku_search_list);
//        search_result.put("iqiyi_search_list" , iqiyi_search_list);
//        search_result.put("sohu_search_list" , sohu_search_list);
//        search_result.put("tengxun_search_list" , tengxun_search_list);

        List allList = new ArrayList();
        if (type == 0){
            allList.addAll(youku_search_list);
            allList.addAll(iqiyi_search_list);
            allList.addAll(sohu_search_list);
            allList.addAll(tengxun_search_list);
        }
        if (type == 1){
            allList.addAll(youku_search_list);
        }
        if (type == 2){
            allList.addAll(iqiyi_search_list);
        }
        if (type == 3){
            allList.addAll(sohu_search_list);
        }
        if (type == 4){
            allList.addAll(tengxun_search_list);
        }
        search_result.put("list",allList);
        return search_result;
    }

    @Override
    public List detail(Integer type) {
        String date =  DateUtil.format(new Date(),"yyyy-MM-dd");
        Map map = new HashMap();
        List list = new ArrayList();
        if (type == 1){
            list.addAll(teleplayDOMapper.selectByDomain(date,"youku.com"));
        }
        else if (type == 2){
            list.addAll(teleplayDOMapper.selectByDomain(date,"souhu.com"));
        }
        else if (type == 3){
            list.addAll(teleplayDOMapper.selectByDomain(date,"douban.com"));
        }
        return list;
    }
}
