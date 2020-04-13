package com.xieke.admin.service;

import com.xieke.admin.entity.Clubcard;
import com.xieke.admin.entity.Result;

import java.util.Date;
import java.util.List;

/**
 * 会员卡信息
 */
public interface ClubCardService {


    /**
     * 获取会员卡列表
     * @param page
     * @param limit
     * @return
     */
    List<Clubcard> getAllClubCard(Integer page, Integer limit,String name,String phone);

    /**
     * 获取所有数量
     * @return
     */
    Integer getAllCount();

    /**
     * 添加会员卡项
     * @param clubcard
     * @param paytypeIds
     * @param paytypeMonies
     * @param integral
     * @return
     */
    Result createClubCard(Clubcard clubcard, Integer[] paytypeIds, Double[] paytypeMonies, Integer integral,String firstmoneyId);

    /**
     * 打印会员卡获取会员卡信息
     * @param clubcardNum
     * @return
     */
    Clubcard getClubCardInfo(String clubcardNum);

    /**
     * 审核会员卡信息
     * @param id
     * @return
     */
    Integer examine(String id);

    /**
     * 删除会员卡
     * @param id
     * @return
     */
    Result delClubCard(String id);

    /**
     * 编辑会员卡信息
     * @param clubcard
     * @return
     */
    Result updateClubCard(Clubcard clubcard);

    /**
     * 会员卡延期
     * @param id
     * @param endTime
     * @return
     */
    Integer delay(String id, Date endTime);
}
