package com.service;

import com.domain.LessonDo;
import com.domain.TeacherDO;

import java.util.List;

/**
 * Created by rong on 2017/4/16.
 */
public interface ILoginService {
    TeacherDO isTeacher(String username , String password);

    int insertTeacher(String username, String password, String teacherName);

    int updateTeacher(Integer id,String username,String password,String teacherName);

    int deleteTeacher(Integer id);

}
