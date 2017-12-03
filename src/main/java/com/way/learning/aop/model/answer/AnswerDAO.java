package com.way.learning.aop.model.answer;

import java.sql.SQLException;

public interface AnswerDAO {
	
	public int updatePostCntSubmit(int questionNo)throws SQLException;
	public int updatePostCntRight(int questionNo)throws SQLException;
	public int updateMyCntSubmit(int questionNo, String userId)throws SQLException;
	public int insertMyCntsubmit(int questionNo, String userId)throws SQLException;
	public int updateMyCntRight(int questionNo, String userId)throws SQLException;
	public int insertMyCntRight(int questionNo, String userId)throws SQLException;
	public int updateMyCntWrong(int questionNo, String userId)throws SQLException;
	public int insertMyCntWrong(int questionNo, String userId)throws SQLException;
	

}
