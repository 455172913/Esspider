package com.controller;

import com.VO.CrawlerVo;
import com.common.util.BizCodeEnum;
import com.common.util.ResponseUtils;
import com.google.common.collect.ImmutableMap;
import com.service.ICrawlerSearch;
import com.service.ICrawlerService;
import com.service.ISearchService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by rong on 2017/3/14.
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    @Resource
    ISearchService searchService;

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    @ResponseBody
    public String helloWorld() {
        return "hello";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    @ResponseBody
    Object search(@RequestParam(value = "search_name", required = true) String search_name) {
        Map resultMap = null;
        try {
            resultMap = searchService.search(search_name);
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",resultMap)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));

    }





}
