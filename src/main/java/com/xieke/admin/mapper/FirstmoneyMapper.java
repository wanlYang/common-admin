package com.xieke.admin.mapper;

import com.xieke.admin.entity.Firstmoney;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface FirstmoneyMapper {
    List<Firstmoney> selectAllFirstmoney();

    int insertFirstmoney(Firstmoney firstmoney);

    int updateFirstmoney(Firstmoney firstmoney);

    int deleteFirstmoney(int id);

    List<Firstmoney> findAllListByPage(@Param("start") int start, @Param("limit") Integer limit, @Param("name") String name, @Param("phone") String phone);

    int countByParam(@Param("name") String name, @Param("phone") String phone);

    Firstmoney findByNumber(String number);

    List<Firstmoney> findAllListByPageByCustomerId(@Param("start") int start, @Param("limit") Integer limit, @Param("name") String name, @Param("phone") String phone,@Param("customerId") String customer_id);

    Integer countByParamByCustomerId( @Param("name") String name, @Param("phone") String phone,@Param("customerId") String customer_id);

    Firstmoney findById(String firstmoneyId);
}



