package com.service.impl;

import com.dao.LessonDoMapper;
import com.domain.LessonDo;
import com.domain.StudentDO;
import com.service.ILessonService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by rong on 2017/4/19.
 */
@Service
public class LessonService implements ILessonService {
    @Resource
    LessonDoMapper lessonDoMapper;

    @Override
    public int insertLesson(Integer teacherId, String teacherName, String lessonName, String lessonStart,
                                 String sessonEnd, String weekDay, String lessonNum ,String teachPro) {
        LessonDo lessonDo = new LessonDo();
        lessonDo.setTeacherid(teacherId);
        lessonDo.setTeachername(teacherName);
        lessonDo.setLessonname(lessonName);
        lessonDo.setLessonstart(lessonStart);
        lessonDo.setSessonend(sessonEnd);
        lessonDo.setWeekday(weekDay);
        lessonDo.setLessonnum(lessonNum);
        lessonDo.setTeachpro(teachPro);
        lessonDo.setCallcount("0");

        return lessonDoMapper.insert(lessonDo);
    }

    @Override
    public int updateLesson(Integer lessonId, Integer teacherId, String teacherName, String lessonName,
                            String lessonStart, String sessonEnd, String weekDay, String lessonNum,String teacherPro) {
        LessonDo lessonDo = new LessonDo();
        lessonDo.setId(lessonId);
        lessonDo.setTeacherid(teacherId);
        lessonDo.setTeachername(teacherName);
        lessonDo.setLessonname(lessonName);
        lessonDo.setLessonstart(lessonStart);
        lessonDo.setSessonend(sessonEnd);
        lessonDo.setWeekday(weekDay);
        lessonDo.setLessonnum(lessonNum);
        lessonDo.setTeachpro(teacherPro);
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

    @Override
    public List<LessonDo> selectByTeacherId(Integer userId) {
        List<LessonDo> lessonDos = lessonDoMapper.selectByTeacherId(userId);
        return lessonDos;
    }

    @Override
    public int deleteByLessonId(Integer lessonId) {
        return lessonDoMapper.deleteByPrimaryKey(lessonId);
    }

    @Override
    public List<LessonDo> selectByLessonName(String name) {
        return lessonDoMapper.selectByLessonName(name);
    }
}
