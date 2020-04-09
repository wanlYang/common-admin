package com.xieke.admin.service.impl.pe;

import com.xieke.admin.entity.pe.CoachCourse;
import com.xieke.admin.mapper.pe.CoachCourseMapper;
import com.xieke.admin.service.pe.CoachCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoachCourseServiceImpl implements CoachCourseService {

    @Autowired
    private CoachCourseMapper coachCourseMapper;

    /**
     * 根据教练ID获取对应课程舞种信息
     *
     * @param id
     * @return
     */
    @Override
    public List<CoachCourse> findByCoachId(Integer id) {


        return coachCourseMapper.findCourseByCoachId(id);
    }
}
