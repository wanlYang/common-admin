package com.xieke.admin.entity.pe;

import org.apache.ibatis.type.Alias;

/**
 * 教练和课程绑定
 */
@Alias("CoachCourse")
public class CoachCourse {

    /**
     * ID
     */
    private Integer id;

    /**
     * 课程
     */
    private Course course;


    /**
     * 教练
     */
    private Coach coach;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public Coach getCoach() {
        return coach;
    }

    public void setCoach(Coach coach) {
        this.coach = coach;
    }

    @Override
    public String toString() {
        return "CoachCourse{" +
                "id=" + id +
                ", course=" + course +
                ", coach=" + coach +
                '}';
    }
}
