package com.way.learning.model.question.dao;

import java.util.List;
import java.sql.SQLException;

import com.way.learning.model.question.vo.AlgorithmQuestion;


public interface AlgorithmQuestionDAO {

	public int write(AlgorithmQuestion vo)throws SQLException;
	public void delete(String no)throws SQLException;
	public List<AlgorithmQuestion> getQuestionList(String pageNo)throws SQLException;
	public AlgorithmQuestion showContent(String no)throws SQLException;
	public void updateSubmit(String no)throws SQLException;
	public void updateRight(String no)throws SQLException;
	
}
