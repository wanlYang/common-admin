package com.xieke.admin.service.pe;

import com.xieke.admin.entity.pe.CoachCourse;

import java.util.List;

public interface CoachCourseService {
    /**
     * 根据教练ID获取对应课程舞种信息
     * @param id
     * @return
     */
    List<CoachCourse> findByCoachId(Integer id);
}
