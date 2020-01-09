package com.xieke.admin.mapper;

import com.xieke.admin.entity.Fromsource;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FromsourceMapper {
    List<Fromsource> selectAllFromsource();

    int insertFromsource(Fromsource fromsource);

    int updateFromsorce(Fromsource fromsource);

    int deleteFromsorce(Fromsource fromsource);

    Fromsource findById(Integer id);
}
