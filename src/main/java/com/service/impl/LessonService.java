package com.service.impl;

import com.dao.LessonDoMapper;
import com.domain.LessonDo;
import com.domain.StudentDO;
import com.service.ILessonService;

import javax.annotation.Resource;

/**
 * Created by rong on 2017/4/19.
 */
public class LessonService implements ILessonService {
    @Resource
    LessonDoMapper lessonDoMapper;

    @Override
    public int insertLesson(Integer teacherId, String teacherName, String lessonName, String lessonStart,
                                 String sessonEnd, String weekDay, String lessonNum) {
        LessonDo lessonDo = new LessonDo();
        lessonDo.setTeacherid(teacherId);
        lessonDo.setTeachername(teacherName);
        lessonDo.setLessonname(lessonName);
        lessonDo.setLessonstart(lessonStart);
        lessonDo.setSessonend(sessonEnd);
        lessonDo.setWeekday(weekDay);
        lessonDo.setLessonnum(lessonNum);

        return lessonDoMapper.insert(lessonDo);
    }

    @Override
    public int updateLesson(Integer lessonId, Integer teacherId, String teacherName, String lessonName,
                            String lessonStart, String sessonEnd, String weekDay, String lessonNum) {
        LessonDo lessonDo = new LessonDo();
        lessonDo.setId(lessonId);
        lessonDo.setTeacherid(teacherId);
        lessonDo.setTeachername(teacherName);
        lessonDo.setLessonname(lessonName);
        lessonDo.setLessonstart(lessonStart);
        lessonDo.setSessonend(sessonEnd);
        lessonDo.setWeekday(weekDay);
        lessonDo.setLessonnum(lessonNum);
        return lessonDoMapper.updateByPrimaryKeySelective(lessonDo);
    }

    @Override
    public int addTeachPro(Integer lessonId, String teachPro) {
        LessonDo lessonDo = new LessonDo();
        lessonDo.setId(lessonId);
        lessonDo.setTeachpro(teachPro);
        return lessonDoMapper.updateByPrimaryKeySelective(lessonDo);
    }

    @Override
    public int addAttend(Integer lessonId) {
        LessonDo temp = lessonDoMapper.selectByPrimaryKey(lessonId);
        LessonDo result = new LessonDo();
        result.setId(lessonId);
        result.setCallcount(new String().valueOf(Integer.parseInt(temp.getCallcount())+1));
        return 0;
    }
}
