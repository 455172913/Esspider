package com.service;

import com.domain.LessonDo;

import java.util.List;

/**
 * Created by rong on 2017/4/19.
 */
public interface ILessonService {
    int insertLesson(Integer teacherId,
                          String teacherName,
                          String lessonName,
                          String lessonStart,
                          String sessonEnd,
                          String weekDay,
                          String lessonNum,
                          String teachPro);

    int updateLesson(Integer lessonId,
                     Integer teacherId,
                     String teacherName,
                     String lessonName,
                     String lessonStart,
                     String sessonEnd,
                     String weekDay,
                     String lessonNum,
                     String teachPro);

    int addTeachPro(Integer lessonId,String teachPro);

    int addAttend(Integer lessonId);

    List<LessonDo> selectByTeacherId(Integer userId);

    List<LessonDo> selectByLessonName(String name);

    int deleteByLessonId(Integer lessonId);



}
