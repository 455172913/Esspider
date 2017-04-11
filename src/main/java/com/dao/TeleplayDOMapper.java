package com.dao;

import com.domain.TeleplayDO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TeleplayDOMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TeleplayDO record);

    int insertSelective(TeleplayDO record);

    TeleplayDO selectByUrl(String url);

    int updateByPrimaryKeySelective(TeleplayDO record);

    int updateByPrimaryKey(TeleplayDO record);

    List<TeleplayDO> selectByDate(String date);
}