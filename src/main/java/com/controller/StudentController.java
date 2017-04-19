package com.controller;

import com.common.util.BizCodeEnum;
import com.common.util.ResponseUtils;
import com.domain.StudentDO;
import com.google.common.base.Splitter;
import com.google.common.collect.ImmutableMap;
import com.service.IStudentService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created by rong on 2017/4/16.
 */
@Controller
public class StudentController {



    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    @ResponseBody
    public String helloWorld() {
        return "hello";
    }

    @Resource
    IStudentService studentService;

    @RequestMapping(value = "/insert", method = RequestMethod.GET)
    @ResponseBody
    Object insert(@RequestParam(value = "studentName", required = true) String studentName,
                  @RequestParam(value = "studentNumber", required = true) String studentNumber,
                  @RequestParam(value = "className", required = true) String className,
                  @RequestParam(value = "lessonId", required = true) Integer lessonId,
                  @RequestParam(value = "lessonName", required = true) String lessonName) {
        int result = 0;
        try {
            result = studentService.insertStudent(studentName,studentNumber,className,lessonId,lessonName);
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",result)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));

    }
    @RequestMapping(value = "/selectById", method = RequestMethod.GET)
    @ResponseBody
    Object selectById(@RequestParam(value = "studentId", required = true) Integer studentId) {
        StudentDO result = null;
        try {
            result = studentService.selectById(studentId);
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",result)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));

    }

    @RequestMapping(value = "/selectByLesson", method = RequestMethod.GET)
    @ResponseBody
    Object selectByLessonId(@RequestParam(value = "lessonId", required = true) Integer lessonId) {
        List result = null;
        try {
            result = studentService.selectByLessonId(lessonId);
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
    Object deleteStudent(@RequestParam(value = "studentId", required = true) Integer studentId) {
        int result = 0;
        try {
            result = studentService.deleteStudent(studentId);
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",result)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));
    }

    @RequestMapping(value = "/updateStudentInfo", method = RequestMethod.GET)
    @ResponseBody
    Object updateStudentInfo(@RequestParam(value = "studentId", required = true) Integer studentId,
                             @RequestParam(value = "studentName", required = false) String studentName,
                             @RequestParam(value = "studentNumber", required = false) String studentNumber,
                             @RequestParam(value = "className", required = false) String className) {
        int result = 0;
        try {
            result = studentService.updateStudentInfo(studentId,studentName,studentNumber,className);
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",result)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));
    }

    @RequestMapping(value = "/addAttendCount", method = RequestMethod.GET)
    @ResponseBody
    Object addAttendCount(@RequestParam(value = "studentIds", required = true) String studentIds,
                          @RequestParam(value = "lessonId", required = true) Integer lessonId) {
        List<Integer> sutdentIdList = Splitter.on(",").splitToList(studentIds).stream().map(it->Integer.valueOf(it)).collect(Collectors.toList());
        int result = 0;
        try {
            result = studentService.addAttendCount(sutdentIdList,lessonId);
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",result)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));
    }

    @RequestMapping(value = "/addUsualScore", method = RequestMethod.GET)
    @ResponseBody
    Object addUsualScore(@RequestParam(value = "studentId", required = false) Integer studentId,
                         @RequestParam(value = "usualScore", required = false) Integer usualScore) {
        int result = 0;
        try {
            result = studentService.addUsualScoer(studentId,usualScore);
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",result)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));
    }

    @RequestMapping(value = "/addExamScore", method = RequestMethod.GET)
    @ResponseBody
    Object addExamScore(@RequestParam(value = "studentId", required = true) Integer studentId,
                        @RequestParam(value = "examScore", required = false) Integer examScore) {
        int result = 0;
        try {
            result = studentService.addExamScore(studentId,examScore);
            return ResponseUtils.getResponse(ImmutableMap.<String, Object>builder()
                    .put("result",result)
                    .build(), BizCodeEnum.SUCCESS.code, "success");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return ResponseUtils.getResponseError(BizCodeEnum.SERVER_ERR.code,BizCodeEnum.getMsg(BizCodeEnum.SERVER_ERR.code));
    }

}
