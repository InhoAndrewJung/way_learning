package com.way.learning.service.course;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.way.learning.model.course.dao.LectureReplyDAO;

@Service
public class LectureReplyServiceImpl implements LectureReplyService {
	
	@Autowired
	private LectureReplyDAO lectureReplyDAO;

}

