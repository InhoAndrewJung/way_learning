package com.way.learning.controller.course;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.way.learning.model.course.dao.LectureBoardDAO;

@Controller
@RequestMapping()
public class LectureBoardController {
	
	@Autowired
	private LectureBoardDAO lectureBoardDAO;

}
