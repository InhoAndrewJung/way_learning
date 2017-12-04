package com.way.learning.service.question;

import java.sql.SQLException;
import java.util.List;

import com.way.learning.model.question.vo.AlgorithmQuestion;

public interface AlgorithmQuestionService {

	public int write(AlgorithmQuestion vo, String string)throws SQLException;
	public void delete(String no)throws SQLException;
	public List<AlgorithmQuestion> getQuestionList(String pageNo)throws SQLException;
	public AlgorithmQuestion showContent(String no)throws SQLException;
	public void updateSubmit(String no, String string)throws SQLException;
	public void updateRight(String no)throws SQLException;
}
