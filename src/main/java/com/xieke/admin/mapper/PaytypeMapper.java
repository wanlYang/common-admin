package com.xieke.admin.mapper;

import com.xieke.admin.entity.Paytype;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface PaytypeMapper {
    boolean deletePaytype(int id);

    boolean insertPaytype(Paytype paytype);

    List<Paytype> selectAllPaytype(@Param("start") int page, @Param("limit") int limit);

    boolean updatePaytype(Paytype paytype);

    Paytype findById(Integer id);

    int countPaytype();

    List<Paytype> findAll();
}
