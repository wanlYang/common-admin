package com.xieke.admin.mapper.pe;

import com.xieke.admin.entity.pe.Officetime;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface OfficetimeMapper {

    List<Officetime> selectOfficetime(@Param("start") Integer start, @Param("limit") Integer limit, Officetime officetime);
    
    Officetime findById(int id);

    Integer countOfficetime();

    Integer updateOfficetime(Officetime officetime);

    Integer insertOfficetime(Officetime officetime);

    Integer delOfficetime(Officetime officetime);

    List<Officetime> selectOfficetimeAll();

}
