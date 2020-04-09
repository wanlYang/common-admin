package com.xieke.admin.mapper.pe;

import com.xieke.admin.entity.pe.Coach;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
@Mapper
public interface CoachMapper {

    List<Coach> selectAllCoach(@Param("start") int start, @Param("limit") Integer limit, @Param("name") String name, @Param("phone") String phone);

    int countCoach(@Param("name") String name, @Param("phone") String phone);

    int delCoach(Coach coach);

    Integer insertCoach(Coach coach);

    Coach findById(Integer id);

    int updateCoach(Coach coach);

    List<Coach> allCoach();

    Integer countAll();

    List<Coach> findByName(String name);
}
