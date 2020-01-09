package com.xieke.admin.mapper;

import com.xieke.admin.entity.ClubCardPaytype;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClubCardPaytypeMapper {

    Integer insert(ClubCardPaytype clubCardPaytype);

    List<ClubCardPaytype> findByClubCardId(int id);

    Integer delByClubCardId(int id);
}
