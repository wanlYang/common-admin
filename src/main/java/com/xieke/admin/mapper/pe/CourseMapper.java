package com.xieke.admin.mapper.pe;

import com.xieke.admin.entity.pe.Course;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CourseMapper {

    List<Course> findAll();

    int count();

    Integer create(Course course);

    Integer update(Course course);

    Integer del(Integer id);

    Course findById(Integer id);
}
