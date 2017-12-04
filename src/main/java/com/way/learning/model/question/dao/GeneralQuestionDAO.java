package com.way.learning.model.question.dao;

import java.sql.SQLException;
import java.util.List;

import com.way.learning.model.question.vo.AlgorithmQuestion;
import com.way.learning.model.question.vo.GeneralQuestion;

public interface GeneralQuestionDAO {
	public int write(GeneralQuestion vo)throws SQLException;
	public void delete(String no)throws SQLException;
	public List<GeneralQuestion> getQuestionList(String pageNo)throws SQLException;
	public GeneralQuestion showContent(String no)throws SQLException;
	public void updateSubmit(String no)throws SQLException;
	public void updateRight(String no)throws SQLException;
}
