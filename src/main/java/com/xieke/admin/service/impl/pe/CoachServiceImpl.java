package com.xieke.admin.service.impl.pe;

import com.xieke.admin.entity.pe.Coach;
import com.xieke.admin.entity.pe.CoachCourse;
import com.xieke.admin.mapper.pe.CoachCourseMapper;
import com.xieke.admin.mapper.pe.CoachMapper;
import com.xieke.admin.mapper.pe.CourseMapper;
import com.xieke.admin.service.pe.CoachService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class CoachServiceImpl implements CoachService {

    @Resource
    private CoachMapper coachMapper;
    @Resource
    private CoachCourseMapper coachCourseMapper;
    @Resource
    private CourseMapper courseMapper;

    @Override
    public List<Coach> selectAllCoach(Integer page, Integer limit,String name,String phone) {
        return coachMapper.selectAllCoach((page-1)*limit ,limit,name,phone);
    }

    @Override
    public int countCoach(String name, String phone) {
        return coachMapper.countCoach(name,phone);
    }

    @Override
    public int delCoach(Coach coach) {
        return coachMapper.delCoach(coach);
    }

    @Override
    public Integer insertCoach(Coach coach,Integer[] course) {
        int row = coachMapper.insertCoach(coach);
        for (int i : course ) {
            CoachCourse coachCourse = new CoachCourse();
            coachCourse.setCoach(coachMapper.findById(coach.getId()));
            coachCourse.setCourse(courseMapper.findById(i));
            coachCourseMapper.insertCoachCourse(coachCourse);
        }
        return row;
    }
}
