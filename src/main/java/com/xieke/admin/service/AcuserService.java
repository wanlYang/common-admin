package com.xieke.admin.service;

import com.xieke.admin.entity.Acuser;
import com.xieke.admin.entity.Gift;

import java.util.List;

public interface AcuserService {
    List<Acuser> selectAllAcuser(int limit, int page, String name, String phone);

    int countAcuser(String name, String phone);

    Integer insertAcuser(Acuser acuser);

    Acuser findByPhone(String phone);

    List<Acuser> selectUsableAcuser(int limit, int page, String name, String phone);

    int countUsableAcuser(String name, String phone);

    /**
     * 设定中奖用户
     * @param acuser
     * @return
     */
    Integer insertWinnerAcuser(Acuser acuser);

    /**
     * 获取设定
     * @return
     */
    List<Acuser> selectWinnerAcuser();

    /**
     * 删除设定
     * @return
     */
    Integer delWinnerAcuser();


    /**
     * 记录中奖人
     * @param gift
     * @return
     */
    Integer insertGift(Gift gift);
}
