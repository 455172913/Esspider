package com.service.impl;

import com.service.ICrawlerService;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by rong on 2017/4/2.
 */
@Service
public class CrawlerService implements ICrawlerService , Job {
    @Resource
    CrawlerHandler crawlerHandler;

    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        Crawler();
    }

    @Override
    public boolean Crawler() {


        return false;
    }
}
