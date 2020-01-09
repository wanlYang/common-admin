package com.xieke.admin.web.pe;

import com.xieke.admin.entity.Result;
import com.xieke.admin.entity.pe.CoachCourse;
import com.xieke.admin.entity.pe.Course;
import com.xieke.admin.service.pe.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 私教管理   课程管理
 */
@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    private CourseService courseService;
    @RequestMapping("/list")
    public String list(){
        return "/course/list";
    }
    @RequestMapping("/add")
    public String add(){
        return "/course/add";
    }

    @RequestMapping("/edit")
    public String edit(){
        return "/course/edit";
    }

    @RequestMapping("/list/data")
    @ResponseBody
    public Result selectAll(){
        Result result = new Result();
        List<Course> courses = courseService.selectAll();
        int count = courseService.count();
        result.setStatus(200);
        result.setMessage("获取成功!");
        result.setCount(count);
        result.setData(courses);
        return result;
    }

    /**
     * 根据教练信息获取对应课程
     * @param id
     * @return
     */
    @RequestMapping("/get/course")
    @ResponseBody
    public Result get(Integer id){
        Result result = new Result();
        List<CoachCourse> coachCourses = courseService.getByCoachId(id);
        result.setStatus(200);
        result.setMessage("获取成功!");
        result.setCount(coachCourses.size());
        result.setData(coachCourses);
        return result;
    }



    @RequestMapping("/add/submit")
    @ResponseBody
    public Result addSubmit(Course course){
        Result result = new Result();
        Integer row = courseService.create(course);
        if (row > 0){
            result.setStatus(200);
            result.setMessage("添加成功!");
            result.setCount(row);
            result.setData(row);
            return result;
        }
        result.setStatus(-1);
        result.setMessage("添加失败!");
        result.setCount(row);
        result.setData(row);
        return result;
    }

    @RequestMapping("/edit/submit")
    @ResponseBody
    public Result editSubmit(Course course){
        Result result = new Result();
        Integer row = courseService.update(course);
        if (row > 0){
            result.setStatus(200);
            result.setMessage("编辑成功!");
            result.setCount(row);
            result.setData(row);
            return result;
        }
        result.setStatus(-1);
        result.setMessage("编辑失败!");
        result.setCount(row);
        result.setData(row);
        return result;
    }

    @RequestMapping("/del/submit")
    @ResponseBody
    public Result delSubmit(Integer[] idArr){
        Result result = new Result();
        Integer row = courseService.del(idArr);
        if (row > 0){
            result.setStatus(200);
            result.setMessage("删除成功!");
            result.setCount(row);
            result.setData(row);
            return result;
        }
        result.setStatus(-1);
        result.setMessage("删除失败!");
        result.setCount(row);
        result.setData(row);
        return result;
    }


}
