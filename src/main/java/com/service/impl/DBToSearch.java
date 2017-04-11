package com.service.impl;

import com.VO.CrawlerVo;
import com.common.util.DateUtil;
import com.dao.TeleplayDOMapper;
import com.domain.TeleplayDO;
import com.repository.CrawlerRepository;
import com.service.ICrawlerSearch;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by rong on 2017/4/11.
 */
@Service
@Component
@Configurable
@EnableScheduling
public class DBToSearch {

    @Resource
    ICrawlerSearch crawlerSearch;

    @Resource
    CrawlerRepository crawlerRepository;

    @Resource
    TeleplayDOMapper teleplayDOMapper;

    @Scheduled(cron = "1 30 14 * * ?")
    public void execute() {
        String date = DateUtil.format(new Date(),"yyyy-MM-dd");
        List<TeleplayDO> teleplayDOList = teleplayDOMapper.selectByDate(date);
        for (TeleplayDO teleplayDO : teleplayDOList){
            CrawlerVo crawlerVo = new CrawlerVo();
            crawlerVo.setId(teleplayDO.getId());
            crawlerVo.setDomain(teleplayDO.getDomain());
            crawlerVo.setName(teleplayDO.getName());
            crawlerVo.setUrl(teleplayDO.getUrl());
            crawlerRepository.save(crawlerVo);
        }
    }
}
