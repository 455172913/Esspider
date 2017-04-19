package com.controller;

import com.common.util.BizCodeEnum;
import com.common.util.ResponseUtils;
import com.google.common.collect.ImmutableMap;
import com.service.ILessonService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by rong on 2017/4/18.
 */
@Controller
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
    Object insert(@RequestParam(value = "teacherId", required = true) Integer teacherId,
                  @RequestParam(value = "teacherName", required = true) String teacherName,
                  @RequestParam(value = "lessonName", required = true) String lessonName,
                  @RequestParam(value = "lessonStart", required = true) String lessonStart,
                  @RequestParam(value = "lessonEnd", required = true) String sessonEnd,
                  @RequestParam(value = "weekDay", required = true) String weekDay,
                  @RequestParam(value = "lessonNum", required = true) String lessonNum) {
        int result = 0;
        try {
            result = lessonService.insertLesson(teacherId,teacherName,lessonName,lessonStart,sessonEnd,weekDay,lessonNum);
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
    Object upadte(@RequestParam(value = "lessonId", required = false) Integer lessonId,
                  @RequestParam(value = "teacherId", required = false) Integer teacherId,
                  @RequestParam(value = "teacherName", required = false) String teacherName,
                  @RequestParam(value = "lessonName", required = false) String lessonName,
                  @RequestParam(value = "lessonStart", required = false) String lessonStart,
                  @RequestParam(value = "lessonEnd", required = false) String sessonEnd,
                  @RequestParam(value = "weekDay", required = false) String weekDay,
                  @RequestParam(value = "lessonNum", required = false) String lessonNum) {
        int result = 0;
        try {
            result = lessonService.updateLesson(lessonId,teacherId,teacherName,lessonName,lessonStart,sessonEnd,weekDay,lessonNum);
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

}
