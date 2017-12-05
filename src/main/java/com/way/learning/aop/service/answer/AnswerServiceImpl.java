package com.way.learning.aop.service.answer;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.way.learning.aop.model.answer.AnswerDAO;

@Service
public class AnswerServiceImpl implements AnswerService {

	@Autowired
	private AnswerDAO answerDAO;

	public int updatePostCntSubmit(int questionNo)throws SQLException{
		int result=answerDAO.updatePostCntSubmit(questionNo);
		System.out.println("updatePostCntSubmit 결과:"+result);
		return result;


	}
	public int updatePostCntRight(int questionNo)throws SQLException{
		int result=answerDAO.updatePostCntRight(questionNo);
		System.out.println("updatePostCntRight 결과:"+result);
		return result;
	}	
	
	

	public int updateMyCntSubmit(int questionNo, String userId)throws SQLException{
		
		int result=answerDAO.updateMyCntSubmit(questionNo, userId);
		System.out.println("updateMyCntSubmit 결과:"+result);
		if(result == 0){
			int insert=answerDAO.insertMyCntsubmit(questionNo, userId);
			System.out.println("insert결과:"+insert);
		}
		return result;
	}
	
	public int updateMyCntRight(int questionNo, String userId)throws SQLException{
		
		int result=answerDAO.updateMyCntRight(questionNo, userId);
		System.out.println("updateMyCntRight 결과:"+result);
		if(result == 0){
			int insert=answerDAO.insertMyCntRight(questionNo, userId);
			System.out.println("insert결과:"+insert);
		}
		return result;
	}
	
public int updateMyCntWrong(int questionNo, String userId)throws SQLException{
		
		int result=answerDAO.updateMyCntWrong(questionNo, userId);
		System.out.println("updateMyCntWrong 결과:"+result);
		if(result == 0){
			int insert=answerDAO.insertMyCntWrong(questionNo, userId);
			System.out.println("insert결과:"+insert);
		}
		return result;
	}

public int updateMyCntError(int questionNo, String userId)throws SQLException{
	
	int result=answerDAO.updateMyCntError(questionNo, userId);
	System.out.println("updateMyCntError 결과:"+result);
	if(result == 0){
		int insert=answerDAO.insertMyCntError(questionNo, userId);
		System.out.println("insert결과:"+insert);
	}
	return result;
}
		
	
	
	

}
