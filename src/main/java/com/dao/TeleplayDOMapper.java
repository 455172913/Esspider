package com.dao;

import com.domain.TeleplayDO;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeleplayDOMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TeleplayDO record);

    int insertSelective(TeleplayDO record);

    TeleplayDO selectByUrl(String url);

    TeleplayDO selectByNameDomain(@Param("name")String name,@Param("domain") String domain);

    int updateByPrimaryKeySelective(TeleplayDO record);

    int updateByPrimaryKey(TeleplayDO record);

    List<TeleplayDO> selectByDomain(@Param("updateDate") String updateDate, @Param("domain")String domain);

    List<TeleplayDO> selectByDate(String insertDate);
}