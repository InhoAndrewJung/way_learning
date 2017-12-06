package com.way.learning.controller.course;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.way.learning.service.course.LectureReplyService;

@Controller
@RequestMapping()
public class LectureReplyController {
	
	@Autowired
	private LectureReplyService lectureReplyService;

}
