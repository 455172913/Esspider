package com.dao;

import com.domain.TeleplayDO;
import org.springframework.stereotype.Repository;

@Repository
public interface TeleplayDOMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TeleplayDO record);

    int insertSelective(TeleplayDO record);

    TeleplayDO selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TeleplayDO record);

    int updateByPrimaryKey(TeleplayDO record);
}