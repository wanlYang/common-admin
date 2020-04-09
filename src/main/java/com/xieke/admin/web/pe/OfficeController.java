package com.xieke.admin.web.pe;

import com.xieke.admin.entity.Result;
import com.xieke.admin.entity.pe.Office;
import com.xieke.admin.service.pe.OfficeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
@RequestMapping("/office")
public class OfficeController {

    @Resource
    private OfficeService officeService;
    @RequestMapping("/add")
    public String add(){
        return "/office/add";
    }

    @RequestMapping("/list")
    public ModelAndView list(ModelAndView modelAndView){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        while (calendar.get(Calendar.DAY_OF_WEEK) != Calendar.MONDAY) {
            calendar.add(Calendar.DAY_OF_WEEK, -1);
        }
        String[] dates = new String[7];
        for (int i = 0; i < 7; i++) {
            dates[i] = dateFormat.format(calendar.getTime());
            calendar.add(Calendar.DATE, 1);
        }
        long l = System.currentTimeMillis();
        long end = l/(1000*3600*24)*(1000*3600*24)-TimeZone.getDefault().getRawOffset();
        Date date = new Date(end);
        List<Date> days = dateToWeek(date);
        modelAndView.addObject("weeks",days);
        modelAndView.addObject("end",end);
        //查找所有教练信息，包括班次安排
        //周一
        List<Office> officesOne = officeService.getAllOffice();
        Iterator<Office> iterator = officesOne.iterator();
        while (iterator.hasNext()){
            Office next = iterator.next();
            if (!belongCalendar(days.get(0),next.getStarttime(),next.getEndtime())){
                iterator.remove();
            }
        }
        modelAndView.addObject("officesOne",officesOne);
        //周二
        List<Office> officesTwo = officeService.getAllOffice();
        Iterator<Office> iteratorTwo = officesTwo.iterator();
        while (iteratorTwo.hasNext()){
            Office next = iteratorTwo.next();
            if (!belongCalendar(days.get(1),next.getStarttime(),next.getEndtime())){
                iteratorTwo.remove();
            }
        }
        modelAndView.addObject("officesTwo",officesTwo);
        //周三
        List<Office> officesThree = officeService.getAllOffice();
        Iterator<Office> iteratorThree = officesThree.iterator();
        while (iteratorThree.hasNext()){
            Office next = iteratorThree.next();
            if (!belongCalendar(days.get(2),next.getStarttime(),next.getEndtime())){
                iteratorThree.remove();
            }
        }
        modelAndView.addObject("officesThree",officesThree);
        //周四
        List<Office> officesFour = officeService.getAllOffice();
        Iterator<Office> iteratorFour = officesFour.iterator();
        while (iteratorFour.hasNext()){
            Office next = iteratorFour.next();
            if (!belongCalendar(days.get(3),next.getStarttime(),next.getEndtime())){
                iteratorFour.remove();
            }
        }
        modelAndView.addObject("officesFour",officesFour);

        //周五
        List<Office> officesFive = officeService.getAllOffice();
        Iterator<Office> iteratorFive = officesFive.iterator();
        while (iteratorFive.hasNext()){
            Office next = iteratorFive.next();
            if (!belongCalendar(days.get(4),next.getStarttime(),next.getEndtime())){
                iteratorFive.remove();
            }
        }
        modelAndView.addObject("officesFive",officesFive);
        //周六
        List<Office> officesSix = officeService.getAllOffice();
        Iterator<Office> iteratorSix = officesSix.iterator();
        while (iteratorSix.hasNext()){
            Office next = iteratorSix.next();
            if (!belongCalendar(days.get(5),next.getStarttime(),next.getEndtime())){
                iteratorSix.remove();
            }
        }
        modelAndView.addObject("officesSix",officesSix);
        //周天
        List<Office> officesSevn = officeService.getAllOffice();
        Iterator<Office> iteratorSevn = officesSevn.iterator();
        while (iteratorSevn.hasNext()){
            Office next = iteratorSevn.next();
            if (!belongCalendar(days.get(6),next.getStarttime(),next.getEndtime())){
                iteratorSevn.remove();
            }
        }
        modelAndView.addObject("officesSevn",officesSevn);

        modelAndView.setViewName("/office/list");
        return modelAndView;
    }

    //上、下周按钮
    @RequestMapping("/listweek")
    public ModelAndView listweek(ModelAndView modelAndView,Long timestamp){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Calendar calendar = Calendar.getInstance();
        while (calendar.get(Calendar.DAY_OF_WEEK) != Calendar.MONDAY) {
            calendar.add(Calendar.DAY_OF_WEEK, -1);
        }
        String[] dates = new String[7];
        for (int i = 0; i < 7; i++) {
            dates[i] = dateFormat.format(calendar.getTime());
            calendar.add(Calendar.DATE, 1);
        }
        long l = System.currentTimeMillis();
        Date date = new Date(timestamp);
        List<Date> days = dateToWeek(date);
        //查找所有教练信息，包括班次安排
        //周一
        List<Office> officesOne = officeService.getAllOffice();
        Iterator<Office> iterator = officesOne.iterator();
        while (iterator.hasNext()){
            Office next = iterator.next();
            if (!belongCalendar(days.get(0),next.getStarttime(),next.getEndtime())){
                iterator.remove();
            }
        }
        modelAndView.addObject("officesOne",officesOne);
        //周二
        List<Office> officesTwo = officeService.getAllOffice();
        Iterator<Office> iteratorTwo = officesTwo.iterator();
        while (iteratorTwo.hasNext()){
            Office next = iteratorTwo.next();
            if (!belongCalendar(days.get(1),next.getStarttime(),next.getEndtime())){
                iteratorTwo.remove();
            }
        }
        modelAndView.addObject("officesTwo",officesTwo);
        //周三
        List<Office> officesThree = officeService.getAllOffice();
        Iterator<Office> iteratorThree = officesThree.iterator();
        while (iteratorThree.hasNext()){
            Office next = iteratorThree.next();
            if (!belongCalendar(days.get(2),next.getStarttime(),next.getEndtime())){
                iteratorThree.remove();
            }
        }
        modelAndView.addObject("officesThree",officesThree);
        //周四
        List<Office> officesFour = officeService.getAllOffice();
        Iterator<Office> iteratorFour = officesFour.iterator();
        while (iteratorFour.hasNext()){
            Office next = iteratorFour.next();
            if (!belongCalendar(days.get(3),next.getStarttime(),next.getEndtime())){
                iteratorFour.remove();
            }
        }
        modelAndView.addObject("officesFour",officesFour);

        //周五
        List<Office> officesFive = officeService.getAllOffice();
        Iterator<Office> iteratorFive = officesFive.iterator();
        while (iteratorFive.hasNext()){
            Office next = iteratorFive.next();
            if (!belongCalendar(days.get(4),next.getStarttime(),next.getEndtime())){
                iteratorFive.remove();
            }
        }
        modelAndView.addObject("officesFive",officesFive);
        //周六
        List<Office> officesSix = officeService.getAllOffice();
        Iterator<Office> iteratorSix = officesSix.iterator();
        while (iteratorSix.hasNext()){
            Office next = iteratorSix.next();
            if (!belongCalendar(days.get(5),next.getStarttime(),next.getEndtime())){
                iteratorSix.remove();
            }
        }
        modelAndView.addObject("officesSix",officesSix);
        //周天
        List<Office> officesSevn = officeService.getAllOffice();
        Iterator<Office> iteratorSevn = officesSevn.iterator();
        while (iteratorSevn.hasNext()){
            Office next = iteratorSevn.next();
            if (!belongCalendar(days.get(6),next.getStarttime(),next.getEndtime())){
                iteratorSevn.remove();
            }
        }
        modelAndView.addObject("officesSevn",officesSevn);
        modelAndView.addObject("weeks",days);
        modelAndView.addObject("end",timestamp);
        modelAndView.setViewName("/office/list");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping("/select")
    public Result selectOffice(){
        List<Office> offices = officeService.selectOffice();
        //List<Coach> coaches = coachService.findByName(name);
        Result result = new Result();
        result.setStatus(200);
        result.setMessage("查询成功@！");
        result.setData(offices);
        return result;
    }

    @ResponseBody
    @RequestMapping("/delete")
    public Result deleteOffice(Office office){
        List<Office> offices = officeService.deleteOffice(office);
        Result result = new Result();
        result.setStatus(200);
        result.setMessage("查询成功@！");
        result.setData(offices);
        return result;
    }

    @ResponseBody
    @RequestMapping("/add/submit")
    public Result add(Office office){
        Integer row = officeService.addOffice(office);
        Result result = new Result();
        result.setStatus(200);
        result.setMessage("添加成功@！");
        result.setData(row);
        return result;
    }

    public static List<Date> dateToWeek(Date mdate) {
        int b = mdate.getDay();
        Date fdate;
        List<Date> list = new ArrayList<Date>();
        Long fTime = mdate.getTime() - b * 24 * 3600000;
        for (int a = 1; a <= 7; a++) {
            fdate = new Date();
            fdate.setTime(fTime + (a * 24 * 3600000));
            list.add(a-1, fdate);
        }
        return list;
    }

    public static boolean belongCalendar(Date nowTime, Date beginTime, Date endTime) {
        //设置当前时间
        Calendar date = Calendar.getInstance();
        date.setTime(nowTime);
        Calendar begin = Calendar.getInstance();
        begin.setTime(beginTime);
        //设置结束时间
        Calendar end = Calendar.getInstance();
        end.setTime(endTime);
        //处于开始时间之后，和结束时间之前的判断
        if (date.after(begin) && date.before(end) || date.equals(begin) || date.equals(end)) {
            return true;
        } else {
            return false;
        }
    }

}
