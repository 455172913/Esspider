package com.service.impl;

import com.dao.LessonDoMapper;
import com.dao.StudentDOMapper;
import com.domain.LessonDo;
import com.domain.StudentDO;
import com.service.ILessonService;
import com.service.IStudentService;
import org.eclipse.jetty.util.StringUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by rong on 2017/4/16.
 */
@Service
public class studentService implements IStudentService{
    @Resource
    StudentDOMapper studentDOMapper;

    @Resource
    ILessonService lessonService;

    @Resource
    LessonDoMapper lessonDoMapper;


    @Override
    public int insertStudent(String studentName, String studentNumber, String className, Integer lessonId) {
        LessonDo lessonDo = lessonDoMapper.selectByPrimaryKey(lessonId);
        StudentDO studentDO = new StudentDO();
        studentDO.setAttendcount(0);
        studentDO.setClassname(className);
        studentDO.setLessonid(lessonId);
        studentDO.setStudentname(studentName);
        studentDO.setUsualscore(0);
        studentDO.setExamscore(0);
        studentDO.setFinalscore(0);
        studentDO.setStudentnumber(studentNumber);
        studentDO.setLessonname(lessonDo.getLessonname());
        return studentDOMapper.insert(studentDO);
    }

    @Override
    public StudentDO selectById(Integer studentId) {
        StudentDO studentDO = studentDOMapper.selectByPrimaryKey(studentId);
        return studentDO;
    }

    @Override
    public int deleteStudent(Integer id) {
        int result = studentDOMapper.deleteByPrimaryKey(id);
        return result;
    }

    @Override
    public List<StudentDO> selectByLessonId(Integer lessonId) {
        List<StudentDO> studentDOList = studentDOMapper.selectByLessonId(lessonId);
        return studentDOList;
    }

    @Override
    public int updateStudentInfo(Integer studentId,String studentName, String studentNumber, String className) {
        StudentDO studentDO = new StudentDO();
        studentDO.setId(studentId);
        if (StringUtil.isNotBlank(studentName)){
            studentDO.setStudentname(studentName);
        }
        if (StringUtil.isNotBlank(studentNumber)){
            studentDO.setStudentnumber(studentNumber);
        }
        if (StringUtil.isNotBlank(className)){
            studentDO.setClassname(className);
        }
        return studentDOMapper.updateByPrimaryKeySelective(studentDO);
    }

    @Override
    public int addAttendCount(List<Integer> studentIds,Integer lessonId) {
        for (Integer studentId : studentIds){
            StudentDO temp = studentDOMapper.selectByPrimaryKey(studentId);
            StudentDO result = new StudentDO();
            result.setId(temp.getId());
            result.setAttendcount(temp.getAttendcount()+1);
            studentDOMapper.updateByPrimaryKeySelective(result);
        }
        lessonService.addAttend(lessonId);
        return 1;
    }

    @Override
    public int addUsualScoer(Integer sutdentId, Integer usualScoer,Integer examScore) {
        StudentDO studentDO = new StudentDO();
        studentDO.setId(sutdentId);
        studentDO.setUsualscore(usualScoer);
        studentDO.setExamscore(examScore);
        studentDO.setFinalscore(usualScoer+examScore);

        return  studentDOMapper.updateByPrimaryKeySelective(studentDO);
    }

}
