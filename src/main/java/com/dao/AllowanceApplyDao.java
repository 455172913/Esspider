//package com.dao;
//
//import com.meituan.zcm.settle.admin.domain.AllowanceApplyDO;
//import org.apache.ibatis.annotations.Param;
//import org.springframework.stereotype.Repository;
//
//import java.util.List;
//
///**
// * Created by jiaomingliang on 16/9/1.
// */
//@Repository
//public interface AllowanceApplyDao {
//
//    int add(@Param("allowanceApplyDO") AllowanceApplyDO allowanceApplyDO);
//
//    List<AllowanceApplyDO> query(@Param("shopId") Integer shopId,
//                                 @Param("deviceId") Integer deviceId,
//                                 @Param("status") Integer status,
//                                 @Param("start") Integer start,
//                                 @Param("pageSize") Integer pageSize,
//                                 @Param("allowanceTypes") List<Integer> allowanceTypes);
//
//    int getCount(@Param("shopId") Integer shopId,
//                 @Param("deviceId") Integer deviceId,
//                 @Param("status") Integer status,
//                 @Param("allowanceTypes") List<Integer> allowanceTypes);
//
//    int updateAllowanceTimeAndAllowanceDetailId(@Param("allowanceTime") Integer allowanceTime,
//                                                @Param("allowanceDetailId") Long allowanceDetailId,
//                                                @Param("applyId") Long applyId);
//
//    AllowanceApplyDO getById(@Param("id") Long id);
//
//    AllowanceApplyDO getByApplyId(@Param("applyId") Long applyId);
//
//    List<AllowanceApplyDO> getAllowanceApplyByOrderId(@Param("orderId") Long orderId);
//
//}
