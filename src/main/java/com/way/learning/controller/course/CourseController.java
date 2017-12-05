package com.way.learning.controller.course;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.way.learning.service.course.CourseService;

@Controller
@RequestMapping()
public class CourseController {
	
	@Autowired
	private CourseService courseService;

}
