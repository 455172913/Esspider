package com.service.impl;

import com.dao.StudentDOMapper;
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


    @Override
    public int insertStudent(String studentName, String studentNumber, String className, Integer lessonId, String lessonName) {
        StudentDO studentDO = new StudentDO();
        studentDO.setAttendcount(0);
        studentDO.setClassname(className);
        studentDO.setLessonid(lessonId);
        studentDO.setLessonname(lessonName);
        studentDO.setStudentname(studentName);
        studentDO.setStudentnumber(studentNumber);
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
    public int addUsualScoer(Integer sutdentId, Integer usualScoer) {
        StudentDO studentDO = new StudentDO();
        studentDO.setId(sutdentId);
        studentDO.setUsualscore(usualScoer);
        return  studentDOMapper.updateByPrimaryKeySelective(studentDO);
    }

    @Override
    public int addExamScore(Integer sutdentId, Integer examScoer) {
        StudentDO temp = studentDOMapper.selectByPrimaryKey(sutdentId);
        StudentDO result = new StudentDO();
        result.setId(temp.getId());
        result.setExamscore(examScoer);
        result.setFinalscore(examScoer + temp.getUsualscore());
        return studentDOMapper.updateByPrimaryKeySelective(result);
    }
}
