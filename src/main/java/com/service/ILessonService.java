package com.service;

import com.domain.LessonDo;

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
                          String lessonNum);

    int updateLesson(Integer lessonId,
                     Integer teacherId,
                     String teacherName,
                     String lessonName,
                     String lessonStart,
                     String sessonEnd,
                     String weekDay,
                     String lessonNum);

    int addTeachPro(Integer lessonId,String teachPro);

    int addAttend(Integer lessonId);


}
