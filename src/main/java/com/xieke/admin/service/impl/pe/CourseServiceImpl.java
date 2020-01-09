package com.xieke.admin.service.impl.pe;

import com.xieke.admin.entity.pe.CoachCourse;
import com.xieke.admin.entity.pe.Course;
import com.xieke.admin.mapper.pe.CoachCourseMapper;
import com.xieke.admin.mapper.pe.CourseMapper;
import com.xieke.admin.service.pe.CourseService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;

    @Autowired
    private CoachCourseMapper coachCourseMapper;
    /**
     * 后台获取课程列表
     *
     * @return
     */
    @Override
    public List<Course> selectAll() {
        return courseMapper.findAll();
    }

    /**
     * 获取所有数量
     *
     * @return
     */
    @Override
    public int count() {
        return courseMapper.count();
    }

    /**
     * 添加课程
     *
     * @param course
     * @return
     */
    @Override
    public Integer create(Course course) {
        if (!StringUtils.isNotBlank(course.getUnitPrice())){
            course.setUnitPrice("0.00");
        }

        return courseMapper.create(course);
    }

    /**
     * 更新
     *
     * @param course
     * @return
     */
    @Override
    public Integer update(Course course) {
        if (!StringUtils.isNotBlank(course.getUnitPrice())){
            course.setUnitPrice("0.00");
        }

        return courseMapper.update(course);
    }

    /**
     * 删除
     *
     * @param idArr
     * @return
     */
    @Override
    public Integer del(Integer[] idArr) {
        Integer row = 0;
        for (Integer id: idArr) {
            row += courseMapper.del(id);
        }
        return row;
    }

    /**
     * 根据教练ID获取课程
     *
     * @param id
     * @return
     */
    @Override
    public List<CoachCourse> getByCoachId(Integer id) {
        return coachCourseMapper.findCourseByCoachId(id);
    }
}
