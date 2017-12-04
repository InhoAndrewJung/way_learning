package com.way.learning.aop.service.activity;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.way.learning.aop.model.activity.ActivityDAO;

@Service
public class ActivityServiceImpl implements ActivityService {
	

	@Autowired
	private ActivityDAO activityDAO;
	
public int updateActivity(String userId,String behavior)throws SQLException{
		
	
		
		
		return activityDAO.updateActivity(userId, behavior);
	}

}
