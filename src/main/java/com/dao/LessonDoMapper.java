package com.dao;

import com.domain.LessonDo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LessonDoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LessonDo record);

    int insertSelective(LessonDo record);

    LessonDo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LessonDo record);

    int updateByPrimaryKeyWithBLOBs(LessonDo record);

    int updateByPrimaryKey(LessonDo record);

    List<LessonDo> selectByTeacherId(Integer userId);

    List<LessonDo> selectByLessonName(String name);
}