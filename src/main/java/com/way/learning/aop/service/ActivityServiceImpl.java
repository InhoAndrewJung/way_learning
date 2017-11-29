package com.way.learning.aop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.way.learning.aop.model.ActivityDAO;

@Service
public class ActivityServiceImpl implements ActivityService {
	

	@Autowired
	private ActivityDAO activityDAO;

}
