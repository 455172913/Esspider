package com.controller;

import com.common.util.BizCodeEnum;
import com.common.util.ResponseUtils;
import com.domain.TeacherDO;
import com.google.common.collect.ImmutableMap;
import com.service.ILoginService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by rong on 2017/4/16.
 */
@Controller
@RequestMapping(value = "/login")
public class LoginController {

    @Resource
    ILoginService loginService;

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    @ResponseBody
    public String helloWorld() {
        return "hello";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    @ResponseBody
    Object login(@RequestParam(value = "username", required = true) String username,@RequestParam(value = "password", required = true) String password) {
        TeacherDO result = null;
        try {
            result = loginService.isTeacher(username,password);
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",result)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));

    }


    @RequestMapping(value = "/insert", method = RequestMethod.GET)
    @ResponseBody
    Object insert(@RequestParam(value = "username", required = true) String username,
                  @RequestParam(value = "password", required = true) String password,
                  @RequestParam(value = "teacherName", required = true) String teacherName) {
        int result = 0;
        try {
            result = loginService.insertTeacher(username,password,teacherName);
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
                  @RequestParam(value = "username", required = true) String username,
                  @RequestParam(value = "password", required = true) String password,
                  @RequestParam(value = "teacherName", required = true) String teacherName) {
        int result = 0;
        try {
            result = loginService.updateTeacher(id,username,password,teacherName);
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
}
