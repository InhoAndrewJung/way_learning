package com.way.learning.service.course;

import java.util.HashMap;
import java.util.List;

import com.way.learning.model.course.vo.LectureReply;

public interface LectureReplyService {
	
	public int insertReply(LectureReply rvo);
	public List<LectureReply> selectListReply(int lectureNo, int courseNo);
	public int updateReply(HashMap<String, Object> mapParam);
	public String selectUpdatedReply(HashMap<String, Object> mapParam);
	public int deleteReply(HashMap<String, Object> mapParam);

}
