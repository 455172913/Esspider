package com.controller;

import com.VO.CrawlerVo;
import com.common.util.BizCodeEnum;
import com.common.util.ResponseUtils;
import com.domain.TeleplayDO;
import com.google.common.collect.ImmutableMap;
import com.service.ICrawlerSearch;
import com.service.ICrawlerService;
import com.service.impl.DBToSearch;
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

    @Resource
    DBToSearch dbToSearch;



    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    @ResponseBody
    public String helloWorld() {
        return "hello";
    }

    @RequestMapping(value = "/crawler", method = RequestMethod.GET)
    @ResponseBody
    Object spider() {
        boolean result = false;
        try {
            result = crawlerService.crawler();
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",result)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));

    }

    @RequestMapping(value = "/crawlerSearch", method = RequestMethod.GET)
    @ResponseBody
    Object crawlerSearch(@RequestParam(value = "name", required = true) String name) {
        List<TeleplayDO> result = null;
        try {
            result = crawlerSearch.findByName(name);
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",result)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));

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
        return crawlerSearch.getcount();
    }

    @RequestMapping(value = "/dbtosearch", method = RequestMethod.GET)
    @ResponseBody
    Object dbToSearch() {
         dbToSearch.execute();
        return true;
    }
}
