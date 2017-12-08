package com.way.learning.service.course;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.way.learning.model.course.dao.LectureReplyDAO;
import com.way.learning.model.course.vo.LectureReply;

@Service
public class LectureReplyServiceImpl implements LectureReplyService {

	@Autowired
	private LectureReplyDAO lectureReplyDAO;

	public int insertReply(LectureReply rvo){

		return lectureReplyDAO.insertReply(rvo);
	}
	
	public List<LectureReply> selectListReply(int lectureNo, int courseNo){

		
		return lectureReplyDAO.selectListReply(lectureNo, courseNo);
	}
	
	public int updateReply(HashMap<String, Object> mapParam){

		return lectureReplyDAO.updateReply(mapParam);
	}
	
	public String selectUpdatedReply(HashMap<String, Object> mapParam){

		return lectureReplyDAO.selectUpdatedReply(mapParam);
	}
	
	public int deleteReply(HashMap<String, Object> mapParam){

		return lectureReplyDAO.deleteReply(mapParam);
	}

}

