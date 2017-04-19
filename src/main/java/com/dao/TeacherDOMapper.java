package com.dao;

import com.domain.TeacherDO;
import org.apache.ibatis.annotations.Param;

public interface TeacherDOMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TeacherDO record);

    int insertSelective(TeacherDO record);

    TeacherDO selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TeacherDO record);

    int updateByPrimaryKey(TeacherDO record);

    TeacherDO selectByUserPwd(@Param("username") String username,@Param("password") String password);
}