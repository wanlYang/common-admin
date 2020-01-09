package com.xieke.admin.service.pe;

import com.xieke.admin.entity.pe.Coach;

import java.util.List;

public interface CoachService {
    List<Coach> selectAllCoach(Integer page, Integer limit, String name, String phone);

    int countCoach(String name, String phone);

    int delCoach(Coach coach);

    Integer insertCoach(Coach coach, Integer[] course);

}