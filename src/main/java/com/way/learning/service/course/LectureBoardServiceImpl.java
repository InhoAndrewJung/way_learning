package com.way.learning.service.course;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.way.learning.model.course.dao.LectureBoardDAO;

@Service
public class LectureBoardServiceImpl implements LectureBoardService {
	
	@Autowired
	private  LectureBoardDAO lectureBoardDAO;

}
