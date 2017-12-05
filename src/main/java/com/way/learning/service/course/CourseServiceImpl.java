package com.way.learning.service.course;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.way.learning.model.course.dao.CourseDAO;

@Service
public class CourseServiceImpl implements CourseService {
	
	@Autowired
	private CourseDAO courseDAO;
	
	

}
