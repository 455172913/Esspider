package com.dao;

import com.domain.StudentDO;

import java.util.List;

public interface StudentDOMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(StudentDO record);

    int insertSelective(StudentDO record);

    StudentDO selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(StudentDO record);

    int updateByPrimaryKey(StudentDO record);

    List<StudentDO> selectByLessonId(Integer lessonId);
}