package com.controller;

import com.service.ISearchService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
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
    Object Search(@RequestParam(value = "search_name", required = true) String search_name) {
        Map resultMap = searchService.search(search_name);
        return resultMap;
    }

    @RequestMapping(value = "/spider", method = RequestMethod.GET)
    @ResponseBody
    Object Spider() {
        Map resultMap = null;
        return resultMap;
    }

}
