package com.xieke.admin.service.pe;

import com.xieke.admin.entity.pe.CoachCourse;
import com.xieke.admin.entity.pe.Course;

import java.util.List;

/**
 * 私教课程管理
 */
public interface CourseService {


    /**
     * 后台获取课程列表
     * @return
     */
    List<Course> selectAll();

    /**
     * 获取所有数量
     * @return
     */
    int count();

    /**
     * 添加课程
     * @param course
     * @return
     */
    Integer create(Course course);

    /**
     * 更新
     * @param course
     * @return
     */
    Integer update(Course course);

    /**
     * 删除
     * @param idArr
     * @return
     */
    Integer del(Integer[] idArr);

    /**
     * 根据教练ID获取课程
     * @param id
     * @return
     */
    List<CoachCourse> getByCoachId(Integer id);
}
