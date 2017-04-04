package com.service.impl;

import com.VO.CrawlerVo;
import com.repository.CrawlerRepository;
import com.service.ICrawlerSearch;
import org.elasticsearch.index.query.MatchQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
/**
 * @author yinlin.sa
 * @since 2017/4/3
 */
@Service
public class CrawlerSearchService implements ICrawlerSearch{
    @Autowired
    CrawlerRepository crawlerRepository;

    public List<CrawlerVo> findByName(String name) {
        MatchQueryBuilder matchQueryBuilder = QueryBuilders.matchPhraseQuery("name", name);
        List<CrawlerVo> crawlerVos = new ArrayList<>();
        for (CrawlerVo book : crawlerRepository.search(matchQueryBuilder)) {
            crawlerVos.add(book);
        }
        return crawlerVos;
    }

    public List<CrawlerVo> findByType(String type) {
        MatchQueryBuilder matchQueryBuilder = QueryBuilders.matchPhraseQuery("type", type);
        List<CrawlerVo> books = new ArrayList<>();
        for (CrawlerVo book : crawlerRepository.search(matchQueryBuilder)) {
            books.add(book);
        }
        return books;
    }

    public void deleteAll() {
        crawlerRepository.deleteAll();
    }

    public long getcount() {
        return crawlerRepository.count();
    }
}
