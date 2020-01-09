package com.xieke.admin.mapper;

import com.xieke.admin.entity.Clubcard;
import com.xieke.admin.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface ClubCardMapper {


    List<Clubcard> findAllListByPage(@Param("start") int start, @Param("limit") Integer limit,@Param("name") String name,@Param("phone") String phone);

    Integer count();
    Integer countByParam(@Param("name") String name,@Param("phone") String phone);

    Integer insert(Clubcard clubcard);

    Clubcard findById(Integer id);

    Clubcard findByClubcardNum(String clubcardNum);

    Integer examine(@Param("id") String id, @Param("checkTime") Date checkTime,User user);

    /**
     * 删除会员卡
     * @param id
     * @return
     */
    Integer deleteById(String id);

    /**
     * 修改信息
     * @param clubcard
     * @return
     */
    Integer update(Clubcard clubcard);
}
