package com.xieke.admin.web.timetable;

import com.xieke.admin.entity.timetable.StoreFront;
import com.xieke.admin.entity.timetable.TableImages;
import com.xieke.admin.service.timetable.TableCourcesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 后台页面跳转控制
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/admin")
public class BackStageViewController {

    @Autowired
    private TableCourcesService tableCourcesService;

    @RequestMapping(value = "/index/li",method = RequestMethod.GET)
    public ModelAndView index_li(HttpSession session, ModelAndView modelAndView) {
        List<StoreFront> lists = tableCourcesService.getAllWeekCourcesDay();
        modelAndView.setViewName("/timetable/index_c");
        modelAndView.addObject("list",lists);
        return modelAndView;
    }

    @RequestMapping(value = "/index/img",method = RequestMethod.GET)
    public ModelAndView index_img(HttpSession session, ModelAndView modelAndView) {
        List<TableImages> lists = tableCourcesService.getAllWeekCourcesDayImg();
        modelAndView.setViewName("/timetable/index_img");
        modelAndView.addObject("list",lists);
        return modelAndView;
    }

  
}
