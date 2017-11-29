package com.way.learning.aop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.way.learning.aop.service.ActivityService;

@Controller
public class ActivityController {
	
	@Autowired
	private ActivityService activityService;

}
