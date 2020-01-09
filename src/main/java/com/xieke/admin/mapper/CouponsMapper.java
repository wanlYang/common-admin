package com.xieke.admin.mapper;

import com.xieke.admin.entity.Coupons;
import com.xieke.admin.entity.UserCou;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface CouponsMapper {
    Coupons findById(int id);

    UserCou findByUserAndCou(@Param("userId") String userId, @Param("couponId") String couponId);

    List<UserCou> selectUserCouByUserId(String userId);

    Integer updateState(@Param("id") String id, @Param("state") int state);

    Integer create(UserCou userCou);

    List<Coupons> findAllCou();

    void updateStateByUserId(@Param("userId") String userId, @Param("state") int state);
}
