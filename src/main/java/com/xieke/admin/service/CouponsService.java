package com.xieke.admin.service;

import com.aliyuncs.exceptions.ClientException;
import com.xieke.admin.entity.Coupons;
import com.xieke.admin.entity.Result;
import com.xieke.admin.entity.UserCou;

import java.util.List;

public interface CouponsService {
    Coupons findById(int id);

    UserCou findUserAndCou(String userId, String couponId);

    List<UserCou> selectUserCouByUserId(String userId);

    Result examine(String id, String coupons) throws ClientException;

    /**
     * 反审核
     * @param userId
     * @return
     */
    Result reverse(String userId);


    Result insert(int id);
}
