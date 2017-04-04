package com.repository;//package com.example.repository;

import com.VO.CrawlerVo;

//
//import com.example.domain.Book;
//
import java.util.List;
//
///**
// * 模糊搜索
// *
// * @author yinlin.sa
// * @since 2017/4/3
// */
public interface BookSearchRepository {

    List<CrawlerVo> findByAuthorName(String authorName);

    List<CrawlerVo> findByType(String type);

}
