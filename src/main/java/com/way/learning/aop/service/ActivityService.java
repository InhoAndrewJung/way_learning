package com.way.learning.aop.service;

import java.sql.SQLException;

public interface ActivityService {
	public int updateLikeActivity(String userId)throws SQLException;

}
