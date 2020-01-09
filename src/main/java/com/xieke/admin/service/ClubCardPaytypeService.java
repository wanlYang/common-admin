package com.xieke.admin.service;

import com.xieke.admin.entity.ClubCardPaytype;

import java.util.List;

public interface ClubCardPaytypeService {


    /**
     * 创建会员卡和付款方式数据
     * @param clubCardPaytype
     * @return
     */
    Integer insert(ClubCardPaytype clubCardPaytype);

    /**
     * 获取会员卡对应支付方式
     * @param id
     * @return
     */
    List<ClubCardPaytype> findByClubCardId(int id);

    /**
     * 删除根据会员卡号
     * @param id
     * @return
     */
    Integer delByClubCardId(int id);
}
