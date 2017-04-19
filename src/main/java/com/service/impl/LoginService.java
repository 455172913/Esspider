package com.service.impl;

import com.dao.TeacherDOMapper;
import com.domain.TeacherDO;
import com.service.ILoginService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by rong on 2017/4/16.
 */
@Service
public class LoginService implements ILoginService{
    @Resource
    TeacherDOMapper teacherDOMapper;

    @Override
    public TeacherDO isTeacher(String username , String password){
        TeacherDO teacherDO = teacherDOMapper.selectByUserPwd(username,password);
        return teacherDO;
    }

    @Override
    public int insertTeacher(String username, String password, String teacherName){
        TeacherDO teacherDO = new TeacherDO();
        teacherDO.setUsername(username);
        teacherDO.setPassword(password);
        teacherDO.setTeachername(teacherName);
        teacherDO.setRoot(false);
        return teacherDOMapper.insert(teacherDO);
    }

    @Override
    public int updateTeacher(Integer id, String username, String password, String teacherName) {
        TeacherDO teacherDO = new TeacherDO();
        teacherDO.setId(id);
        teacherDO.setRoot(false);
        teacherDO.setUsername(username);
        teacherDO.setPassword(password);
        teacherDO.setTeachername(teacherName);
        return teacherDOMapper.updateByPrimaryKey(teacherDO);

    }

    @Override
    public int deleteTeacher(Integer id) {
        return teacherDOMapper.deleteByPrimaryKey(id);
    }
}
