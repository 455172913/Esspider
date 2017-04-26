package com.controller;

import com.common.util.BizCodeEnum;
import com.common.util.ResponseUtils;
import com.domain.TeacherDO;
import com.google.common.collect.ImmutableMap;
import com.service.ILoginService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by rong on 2017/4/16.
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController {

    @Resource
    ILoginService loginService;

    @RequestMapping(value = "/loginPage", method = RequestMethod.GET)
    public String index() {
        return "/page/student/login";
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public String home() {
        return "/page/student/home";
    }

    @RequestMapping(value = "/chengji", method = RequestMethod.GET)
    public String chengji() {
        return "/page/student/chengji";
    }

    @RequestMapping(value = "/chuqin", method = RequestMethod.GET)
    public String chuqin() {
        return "/page/student/chuqin";
    }

    @RequestMapping(value = "/kechengmanage", method = RequestMethod.GET)
    public String kechengmanage() {
        return "/page/student/kechengmanage";
    }

    @RequestMapping(value = "/studentmanage", method = RequestMethod.GET)
    public String studentmanage() {
        return "/page/student/studentmanage";
    }

    @RequestMapping(value = "/teachermanage", method = RequestMethod.GET)
    public String teachermanage() {
        return "/page/student/teachermanage";
    }

    @RequestMapping(value = "/xiaoli", method = RequestMethod.GET)
    public String xiaoli() {
        return "/page/student/xiaoli";
    }

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String user() {
        return "/page/student/user";
    }


    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    @ResponseBody
    public String helloWorld() {
        return "hello";
    }



    @RequestMapping(value = "/login", method = RequestMethod.POST)
    Object login(@RequestParam(value = "username", required = true) String username,
                 @RequestParam(value = "password", required = true) String password,
                 HttpServletResponse httpServletResponse) {
        TeacherDO result = null;
        result = loginService.isTeacher(username,password);
        if (result == null){
            return "/page/student/login";
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
            return "/page/student/index";

        }
    }


    @RequestMapping(value = "/insert", method = RequestMethod.GET)
    @ResponseBody
    Object insert(@RequestParam(value = "username", required = true) String username,
                  @RequestParam(value = "password", required = true) String password,
                  @RequestParam(value = "teacherName", required = true) String teacherName,
                  @RequestParam(value = "root", required = true) Integer root) {
        int result = 0;
        try {
            result = loginService.insertTeacher(username,password,teacherName,root);
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",result)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));

    }


    @RequestMapping(value = "/update", method = RequestMethod.GET)
    @ResponseBody
    Object update(@RequestParam(value = "id", required = true) Integer id,
                  @RequestParam(value = "username", required = false) String username,
                  @RequestParam(value = "password", required = true) String password,
                  @RequestParam(value = "teacherName", required = true) String teacherName,
                  @RequestParam(value = "root", required = false) String root) {
        int result = 0;
        try {
            result = loginService.updateTeacher(id,username,password,teacherName,root);
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",result)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));

    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    @ResponseBody
    Object delete(@RequestParam(value = "id", required = true) Integer id) {
        int result = 0;
        try {
            result = loginService.deleteTeacher(id);
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",result)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));

    }

    @RequestMapping(value = "/selectAllTeacher", method = RequestMethod.GET)
    @ResponseBody
    Object selectAllTeacher() {
        List<TeacherDO> result ;
        try {
            result = loginService.selectAllTeacher();
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",result)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));

    }

    @RequestMapping(value = "/selectTeacherByName", method = RequestMethod.GET)
    @ResponseBody
    Object selectTeacherByName(@RequestParam(value = "teacherName", required = true) String teacherName) {
        List<TeacherDO> result ;
        try {
            result = loginService.selectTeacherByName(teacherName);
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",result)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));

    }

}
