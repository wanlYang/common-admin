package com.xieke.admin.mapper.pe;

import com.xieke.admin.entity.pe.CoachCourse;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CoachCourseMapper {
    /**
     * 根据教练ID获取对应课程
     * @param id
     * @return
     */
    List<CoachCourse> findCourseByCoachId(Integer id);

    int insertCoachCourse(CoachCourse coachCourse);

    int delCoachCourseByCoachId(int id);
}
