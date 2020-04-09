package com.xieke.admin.web.pe;

import com.xieke.admin.service.pe.CoachService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 教练端控制器
 */
@Controller
@RequestMapping("/coach/public")
public class CoachPublicController {

    @Autowired
    private CoachService coachService;




}
