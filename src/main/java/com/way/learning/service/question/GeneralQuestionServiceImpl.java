package com.way.learning.service.question;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.way.learning.model.question.dao.GeneralQuestionDAO;
import com.way.learning.model.question.vo.GeneralQuestion;

@Service
public class GeneralQuestionServiceImpl implements GeneralQuestionService{

	@Autowired
	GeneralQuestionDAO generalQuestionDAO;
	@Override
	public int write(GeneralQuestion vo) throws SQLException {
		// TODO Auto-generated method stub
		
		return generalQuestionDAO.write(vo);
	}

	@Override
	public void delete(String no) throws SQLException {
		// TODO Auto-generated method stub
		generalQuestionDAO.delete(no);
		
	}

	@Override
	public List<GeneralQuestion> getQuestionList(String pageNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public GeneralQuestion showContent(String no) throws SQLException {
		// TODO Auto-generated method stub
		return generalQuestionDAO.showContent(no);
	}

	@Override
	public void updateSubmit(String no) throws SQLException {
		// TODO Auto-generated method stub
		generalQuestionDAO.updateSubmit(no);
	}

	@Override
	public void updateRight(String no) throws SQLException {
		// TODO Auto-generated method stub
		generalQuestionDAO.updateRight(no);
		
	}

}
