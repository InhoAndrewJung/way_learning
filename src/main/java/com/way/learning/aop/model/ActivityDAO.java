package com.way.learning.aop.model;

import java.sql.SQLException;

public interface ActivityDAO {
	
	public int updateLikeActivity(String userId)throws SQLException;

}
