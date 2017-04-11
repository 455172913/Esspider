//package com.dao;
//
//import com.domain.TeleplayDO;
//import org.springframework.stereotype.Component;
//import org.springframework.stereotype.Repository;
//
//import javax.annotation.Resource;
//
///**
// * Created by rong on 2017/4/11.
// */
//@Component
//public class TeleplayDao implements TeleplayDOMapper {
//    @Resource
//    TeleplayDOMapper teleplayDOMapper;
//
//    @Override
//    public int deleteByPrimaryKey(Integer id) {
//        return teleplayDOMapper.deleteByPrimaryKey(id);
//    }
//
//    public int insert(TeleplayDO record){
//        return teleplayDOMapper.insert(record);
//    }
//
//    public int insertSelective(TeleplayDO record){
//        return teleplayDOMapper.insertSelective(record);
//    }
//
//    public TeleplayDO selectByPrimaryKey(Integer id){
//        return selectByPrimaryKey(id);
//    }
//
//    public int updateByPrimaryKeySelective(TeleplayDO record){
//        return teleplayDOMapper.updateByPrimaryKeySelective(record);
//
//    }
//
//    public int updateByPrimaryKey(TeleplayDO record){
//        return teleplayDOMapper.updateByPrimaryKey(record);
//    }
//}
