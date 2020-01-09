package com.xieke.admin.mapper;

import com.xieke.admin.entity.Acuser;
import com.xieke.admin.entity.Coupons;
import com.xieke.admin.entity.Gift;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface AcuserMapper {
    List<Acuser> selectAllAcuser(int limit, int start, String name, String phone);

    int countAcuser(String name,String phone);

    Integer insertAcuser(Acuser acuser);

    Acuser findByPhone(String phone);
    Acuser findById(String id);

    /**
     * 获取当天用户以及未中奖用户
     * @param limit
     * @param i
     * @param name
     * @param phone
     * @return
     */
    List<Acuser> selectUsableAcuser(int limit, int i, String name, String phone);

    int countUsableAcuser(String name, String phone);

    /**
     * 设定中奖用户
     * @param acuser
     * @return
     */
    Integer insertWinnerAcuser(Acuser acuser);

    /**
     * 获取设定
     *
     * @return
     */
    List<Acuser> selectWinnerAcuser();

    /**
     * 删除设定用户
     * @return
     */
    Integer deleteWinnerAcuser();

    /**
     * 记录中奖
     * @param gift
     * @return
     */
    Integer insertGift(Gift gift);
}
