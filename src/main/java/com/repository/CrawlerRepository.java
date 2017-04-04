package com.repository;

import com.VO.CrawlerVo;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import java.util.List;


public interface CrawlerRepository extends ElasticsearchRepository<CrawlerVo, String> {

    CrawlerVo findById(String id);

//    List<CrawlerVo> findByAuthorName(String authorName);
//
//    List<CrawlerVo> findByType(String type);
//
//    List<CrawlerVo> findByBookName(String bookName);
}
