package com.service.impl;

import com.dao.TeacherDOMapper;
import com.domain.TeacherDO;
import com.service.ILoginService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by rong on 2017/4/16.
 */
@Service
public class LoginService implements ILoginService {
    @Resource
    TeacherDOMapper teacherDOMapper;

    @Override
    public TeacherDO isTeacher(String username , String password){
        TeacherDO teacherDO = teacherDOMapper.selectByUserPwd(username,password);
        return teacherDO;
    }

    @Override
    public int insertTeacher(String username, String password, String teacherName,Integer root){
        TeacherDO teacherDO = new TeacherDO();
        teacherDO.setUsername(username);
        teacherDO.setPassword(password);
        teacherDO.setTeachername(teacherName);
        if (root == 1){
            teacherDO.setRoot(true);
        }else {
            teacherDO.setRoot(false);
        }
        return teacherDOMapper.insert(teacherDO);
    }

    @Override
    public int updateTeacher(Integer id, String username, String password, String teacherName,String root) {
        TeacherDO teacherDO = new TeacherDO();
        teacherDO.setId(id);
        teacherDO.setUsername(username);
        teacherDO.setPassword(password);
        teacherDO.setTeachername(teacherName);
        if (root != null && "1".equals(root)){
            teacherDO.setRoot(true);
        }else {
            teacherDO.setRoot(false);
        }
        return teacherDOMapper.updateByPrimaryKeySelective(teacherDO);

    }

    @Override
    public int deleteTeacher(Integer id) {
        return teacherDOMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<TeacherDO> selectAllTeacher() {
        return teacherDOMapper.selectAllTeacher();
    }

    @Override
    public List<TeacherDO> selectTeacherByName(String name) {
        return teacherDOMapper.selectTeacherByName(name);
    }
}
