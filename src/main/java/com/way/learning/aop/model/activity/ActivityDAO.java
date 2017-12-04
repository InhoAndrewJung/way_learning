package com.way.learning.aop.model.activity;

import java.sql.SQLException;

public interface ActivityDAO {
	
	public int updateActivity(String userId,String behavior)throws SQLException;

}
