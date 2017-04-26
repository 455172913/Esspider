package com.controller;

import com.common.util.BizCodeEnum;
import com.common.util.ResponseUtils;
import com.domain.LessonDo;
import com.google.common.collect.ImmutableMap;
import com.service.ILessonService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by rong on 2017/4/18.
 */
@Controller
@RequestMapping(value = "/lesson")
public class LessonController {
    @Resource
    ILessonService lessonService;

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    @ResponseBody
    public String helloWorld() {
        return "hello";
    }

    @RequestMapping(value = "/insert", method = RequestMethod.GET)
    @ResponseBody
    Object insert(@RequestParam(value = "lessonName", required = true) String lessonName,
                  @RequestParam(value = "lessonStart", required = true) String lessonStart,
                  @RequestParam(value = "lessonEnd", required = true) String sessonEnd,
                  @RequestParam(value = "weekDay", required = true) String weekDay,
                  @RequestParam(value = "lessonNum", required = true) String lessonNum,
                  @RequestParam(value = "teachPro", required = true) String teachPro,
                  HttpServletRequest request) {

        Cookie[] cookies = request.getCookies();
        Integer teacherId = 0;

        String teacherName = "";
        for (Cookie cookie : cookies){
            if ("name".endsWith(cookie.getName())){
                teacherName = cookie.getValue();
            }
            if ("userId".endsWith(cookie.getName())){
                teacherId = Integer.parseInt(cookie.getValue());
            }

        }
        int result = 0;
        try {
            result = lessonService.insertLesson(teacherId,teacherName,lessonName,lessonStart,sessonEnd,weekDay,lessonNum,teachPro);
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
    Object upadte(@RequestParam(value = "id", required = false) Integer lessonId,
                  @RequestParam(value = "teacherId", required = false) Integer teacherId,
                  @RequestParam(value = "teacherName", required = false) String teacherName,
                  @RequestParam(value = "lessonName", required = false) String lessonName,
                  @RequestParam(value = "lessonStart", required = false) String lessonStart,
                  @RequestParam(value = "lessonEnd", required = false) String sessonEnd,
                  @RequestParam(value = "weekDay", required = false) String weekDay,
                  @RequestParam(value = "lessonNum", required = false) String lessonNum,
                  @RequestParam(value = "teachpro", required = false) String teacherPro) {
        int result = 0;
        try {
            result = lessonService.updateLesson(lessonId,teacherId,teacherName,lessonName,lessonStart,sessonEnd,weekDay,lessonNum,teacherPro);
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",result)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));

    }

    @RequestMapping(value = "/addTeachPro", method = RequestMethod.GET)
    @ResponseBody
    Object addTeachPro(@RequestParam(value = "lessonId", required = false) Integer lessonId,
                       @RequestParam(value = "teachPro", required = false) String teachPro) {
        int result = 0;
        try {
            result = lessonService.addTeachPro(lessonId,teachPro);
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",result)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));

    }

    @RequestMapping(value = "/selectByTeacherId", method = RequestMethod.GET)
    @ResponseBody
    Object selectByTeacherId(@CookieValue(value = "userId", required = false) Integer userId) {
        List<LessonDo> result = null;
        try {
            result = lessonService.selectByTeacherId(userId);
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",result)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));

    }

    @RequestMapping(value = "/selectByLessonName", method = RequestMethod.GET)
    @ResponseBody
    Object selectByLessonName(@RequestParam(value = "name", required = true) String name) {
        List<LessonDo> result = null;
        try {
            result = lessonService.selectByLessonName(name);
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",result)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));

    }

    @RequestMapping(value = "/deleteById", method = RequestMethod.GET)
    @ResponseBody
    Object deleteById(@RequestParam(value = "lessonId", required = false) Integer lessonId) {
        int result = 0;
        try {
            result = lessonService.deleteByLessonId(lessonId);
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",result)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));

    }

}
