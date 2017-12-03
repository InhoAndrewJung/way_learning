package com.way.learning.aop.service.activity;

import java.sql.SQLException;

public interface ActivityService {
	public int updateActivity(String userId, String behavior)throws SQLException;

}
