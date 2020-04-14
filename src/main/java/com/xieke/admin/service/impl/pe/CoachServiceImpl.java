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
        coachCourseMapper.delCoachCourseByCoachId(coach.getId());
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

    @Override
    public Integer updateCoach(Coach coach, Integer[] course) {
        coachCourseMapper.delCoachCourseByCoachId(coach.getId());
        int row = coachMapper.updateCoach(coach);
        for (int i : course ) {
            CoachCourse coachCourse = new CoachCourse();
            coachCourse.setCoach(coachMapper.findById(coach.getId()));
            coachCourse.setCourse(courseMapper.findById(i));
            coachCourseMapper.insertCoachCourse(coachCourse);
        }
        return row;
    }

    @Override
    public List<Coach> selectAllCoach() {


        return coachMapper.allCoach();
    }

    @Override
    public Integer countCoachAll() {
        return coachMapper.countAll();
    }

    @Override
    public List<Coach> findByName(String name) {
        return coachMapper.findByName(name);
    }

    @Override
    public Coach login(String phone, String password) {


        return coachMapper.login(phone,password);
    }

    @Override
    public Coach findCoachByPhone(String phone) {


        return coachMapper.findByPhone(phone);
    }

    @Override
    public Integer updatePassword(String phone, String newPassword) {


        return coachMapper.updatePassword(phone,newPassword);
    }
}
