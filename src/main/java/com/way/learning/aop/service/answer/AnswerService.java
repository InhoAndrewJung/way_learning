package com.way.learning.aop.service.answer;

import java.sql.SQLException;

public interface AnswerService {
	
	public int updatePostCntSubmit(int questionNo)throws SQLException;
	public int updatePostCntRight(int questionNo)throws SQLException;
	public int updateMyCntSubmit(int questionNo, String userId)throws SQLException;
	public int updateMyCntRight(int questionNo, String userId)throws SQLException;
	public int updateMyCntWrong(int questionNo, String userId)throws SQLException;
	public int updateMyCntError(int questionNo, String userId)throws SQLException;

}
