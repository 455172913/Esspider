package com.service.impl;

import com.VO.CrawlerVo;
import com.dao.TeleplayDOMapper;
import com.domain.TeleplayDO;
import com.repository.CrawlerRepository;
import com.service.ICrawlerSearch;
import org.elasticsearch.index.query.MatchQueryBuilder;
import org.elasticsearch.index.query.QueryBuilders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
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
    @Resource
    TeleplayDOMapper teleplayDOMapper;

    public List<TeleplayDO> findByName(String name) {
        MatchQueryBuilder matchQueryBuilder = QueryBuilders.matchPhraseQuery("name", name);
        List<TeleplayDO> teleplayDOS = new ArrayList<>();
        for (CrawlerVo book : crawlerRepository.search(matchQueryBuilder)) {
            TeleplayDO teleplayDO = teleplayDOMapper.selectByNameDomain(book.getName(),book.getDomain());
            teleplayDOS.add(teleplayDO);
        }
        return teleplayDOS;
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
