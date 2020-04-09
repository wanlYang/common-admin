package com.xieke.admin.mapper.pe;

import com.xieke.admin.entity.pe.Shopping;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ShoppingMapper {
    int insert(Shopping shopping);

    Shopping findById(String id);

    Shopping findByContractId(String id);

    List<Shopping> findByCustomerId(String id);

    int delShoppById(String id);
}
