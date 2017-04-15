package com.repository;

import com.VO.CrawlerVo;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

import java.util.List;


public interface CrawlerRepository extends ElasticsearchRepository<CrawlerVo, Integer> {

    CrawlerVo findById(Integer id);

//    List<CrawlerVo> findByAuthorName(String authorName);
//
//    List<CrawlerVo> findByType(String type);
//
//    List<CrawlerVo> findByBookName(String bookName);
}
