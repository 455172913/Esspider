package com.service;

import com.domain.StudentDO;

import java.util.List;

/**
 * Created by rong on 2017/4/16.
 */
public interface IStudentService {
    int insertStudent(String studentName, String studentNumber, String className, Integer lessonId);

    StudentDO selectById(Integer studentId);

    List<StudentDO> selectByLessonId(Integer lessonId);

    int deleteStudent(Integer id);

    int updateStudentInfo(Integer studentId,String studentName, String studentNumber, String className);

    int addAttendCount(List<Integer> studentIds,Integer lessonId);

    int addUsualScoer(Integer sutdentId,Integer usualScoer,Integer examScoer);

}
