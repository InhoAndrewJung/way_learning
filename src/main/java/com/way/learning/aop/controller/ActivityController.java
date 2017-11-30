package com.way.learning.aop.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.way.learning.aop.service.ActivityService;

@Controller
public class ActivityController {
	
	@Autowired
	private ActivityService activityService;
	


}
