package com.xieke.admin.web.pe;

import com.xieke.admin.entity.Result;
import com.xieke.admin.entity.pe.Coach;
import com.xieke.admin.entity.pe.CoachCourse;
import com.xieke.admin.service.pe.CoachCourseService;
import com.xieke.admin.service.pe.CoachService;
import com.xieke.admin.web.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 教练信息控制类
 */
@Controller
@RequestMapping("/coach")
public class CoachController extends BaseController{

    @Resource
    private CoachService coachService;
    @Resource
    private CoachCourseService coachCourseService;



    @RequestMapping("/list")
    public String selectList(){
        return "/coach/list";
    }
    @RequestMapping("/add")
    public String coachAdd(){
        return "/coach/add";
    }
    @RequestMapping("/edit")
    public String edit(){
        return "/coach/edit";
    }

    @RequestMapping("/select/list")
    public String list(){
        return "/coach/select_list";
    }

    @RequestMapping("/select")
    @ResponseBody
    public Result selectAllCoach(Integer page, Integer limit,String name,String phone){
        List<Coach> coaches = coachService.selectAllCoach(page,limit,name,phone);
        Result result = new Result();
        result.setStatus(200);
        result.setMessage("获取成功@!");
        result.setCount(coachService.countCoach(name, phone));
        result.setData(coaches);
        return result;
    }

    @RequestMapping("/select/all")
    @ResponseBody
    public Result allCoach(){
        List<Coach> coaches = coachService.selectAllCoach();
        Result result = new Result();
        result.setStatus(200);
        result.setMessage("获取成功@!");
        result.setCount(coachService.countCoachAll());
        result.setData(coaches);
        return result;
    }

    @RequestMapping("/insert")
    @ResponseBody
    public Result insertCoach(Coach coach,@RequestParam("course[]") Integer[] course){
        coach.setFromsource("员工");
        Integer coaches = coachService.insertCoach(coach,course);
        Result result = new Result();
        result.setStatus(200);
        result.setMessage("添加成功@!");
        result.setData(coaches);
        return result;
    }


    @RequestMapping("/delete")
    @ResponseBody
    public Result deleteCoach(Coach coach){
        int coaches = coachService.delCoach(coach);
        Result result = new Result();
        result.setStatus(200);
        result.setMessage("删除成功@!");
        result.setData(coaches);
        return result;
    }


    @RequestMapping("/list/data")
    @ResponseBody
    public Result selectAll(Integer page, Integer limit,String name,String phone){
        Result result = new Result();
        List<Coach> coaches = coachService.selectAllCoach(page,limit,name,phone);
        int count = coachService.countCoach(name,phone);
        result.setStatus(200);
        result.setMessage("获取成功!");
        result.setCount(count);
        result.setData(coaches);
        return result;
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result updateCoach(Coach coach,@RequestParam("course[]") Integer[] course){
        Integer coaches = coachService.updateCoach(coach,course);
        Result result = new Result();
        result.setStatus(200);
        result.setMessage("修改成功@!");
        result.setData(coaches);
        return result;
    }

    @RequestMapping("/get/course")
    @ResponseBody
    public Result getCourses(Integer id){
        List<CoachCourse> coachCourses = coachCourseService.findByCoachId(id);
        Result result = new Result();
        result.setStatus(200);
        result.setMessage("获取成功@!");
        result.setData(coachCourses);
        return result;
    }

}
