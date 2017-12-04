package com.way.learning.service.question;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.way.learning.model.question.dao.AlgorithmQuestionDAO;
import com.way.learning.model.question.vo.AlgorithmQuestion;

@Service
public class AlgorithmQuestionServiceImpl implements AlgorithmQuestionService {

	@Autowired
	AlgorithmQuestionDAO algoDao;
	@Override
	public int write(AlgorithmQuestion vo, String userId) throws SQLException {
		// TODO Auto-generated method stub
		
		return algoDao.write(vo, userId);
	}

	@Override
	public void delete(String no) throws SQLException {
		// TODO Auto-generated method stub
		algoDao.delete(no);
	}

	@Override
	public List<AlgorithmQuestion> getQuestionList(String pageNo) throws SQLException {
		// TODO Auto-generated method stub
		List<AlgorithmQuestion> list = algoDao.getQuestionList(pageNo);
		
		return list;
	}

	@Override
	public AlgorithmQuestion showContent(String no) throws SQLException {
		// TODO Auto-generated method stub
		AlgorithmQuestion data = algoDao.showContent(no);
		return data;
	}

	@Override
	public void updateSubmit(String no, String userId) throws SQLException {
		// TODO Auto-generated method stub
		algoDao.updateSubmit(no, userId);
		
	}

	@Override
	public void updateRight(String no) throws SQLException {
		// TODO Auto-generated method stub
		algoDao.updateRight(no);
	}

}
