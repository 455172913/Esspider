package com.controller;

import com.VO.CrawlerVo;
import com.common.util.BizCodeEnum;
import com.common.util.ResponseUtils;
import com.domain.TeacherDO;
import com.domain.TeleplayDO;
import com.google.common.collect.ImmutableMap;
import com.service.ICrawlerSearch;
import com.service.ICrawlerService;
import com.service.ILoginService;
import com.service.ISearchService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
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

    @Resource
    ILoginService loginService;

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    @ResponseBody
    public String helloWorld() {
        return "hello";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "/page/index/index";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(@RequestParam(value = "search_name", required = true) String search_name,
                         @RequestParam(value = "type", required = true) Integer type, ModelMap modelMap) {
        Map resultMap = searchService.search(search_name,type);
        modelMap.put("result",resultMap);
        return "/page/index/list";

    }

    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    @ResponseBody
    Object detail(@RequestParam(value = "type", required = false) Integer type,ModelMap modelMap) {

        try {
            List result = searchService.detail(type);
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",result)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));


    }


    @RequestMapping(value = "/detailPage", method = RequestMethod.GET)
    public String detailPage() {
        return "/page/index/detail";

    }
    @RequestMapping(value = "/loginPage", method = RequestMethod.GET)
    public String loginPage() {
        return "/page/index/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    Object login(@RequestParam(value = "username", required = true) String username,
                 @RequestParam(value = "password", required = true) String password,
                 HttpServletResponse httpServletResponse) {
        TeacherDO result = null;
        result = loginService.isTeacher(username,password);
        if (result == null){
            return "/page/index/login";
        }else {
            Cookie cookie_name = new Cookie("name", result.getTeachername());
            Cookie cookie_username = new Cookie("username", result.getUsername());
            Cookie cookie_root = new Cookie("root", result.getUsername());
            Cookie cookie_userId = new Cookie("userId", String.valueOf(result.getId()));
            cookie_name.setPath("/");
            cookie_userId.setPath("/");
            cookie_root.setPath("/");
            httpServletResponse.addCookie(cookie_name);
            httpServletResponse.addCookie(cookie_username);
            httpServletResponse.addCookie(cookie_root);
            httpServletResponse.addCookie(cookie_userId);
            return "/page/index/index";

        }
    }

}
