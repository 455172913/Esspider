package com.controller;

import com.VO.CrawlerVo;
import com.service.ICrawlerSearch;
import com.service.ICrawlerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by rong on 2017/4/4.
 */
@Controller
@RequestMapping(value = "/crawler")
public class CrawlerController {
    @Resource
    ICrawlerService crawlerService;

    @Resource
    ICrawlerSearch crawlerSearch;

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    @ResponseBody
    public String helloWorld() {
        return "hello";
    }

    @RequestMapping(value = "/crawler", method = RequestMethod.GET)
    @ResponseBody
    Object spider() {
        boolean result = crawlerService.crawler();
        return result;
    }

    @RequestMapping(value = "/crawlerSearch", method = RequestMethod.GET)
    @ResponseBody
    Object crawlerSearch(@RequestParam(value = "name", required = true) String name) {
        List<CrawlerVo> result = crawlerSearch.findByName(name);
        return result;
    }

    @RequestMapping(value = "/deleteAll", method = RequestMethod.GET)
    @ResponseBody
    Object deleteAll() {
        crawlerSearch.deleteAll();
        return true;
    }

    @RequestMapping(value = "/getcount", method = RequestMethod.GET)
    @ResponseBody
    Object getCount() {
        crawlerSearch.deleteAll();
        return true;
    }
}
