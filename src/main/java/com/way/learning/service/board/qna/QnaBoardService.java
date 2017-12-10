package com.way.learning.service.board.qna;


import java.sql.SQLException;

import java.util.List;


import org.springframework.stereotype.Service;


import com.way.learning.model.board.qna.vo.QnaBoard;



@Service
public interface QnaBoardService {
	
	
	
	public int insertBoard(QnaBoard bvo)throws SQLException;
	
	public List<QnaBoard> getBoardList(String Pageno,  String keyword, String sorting) throws SQLException;
	
	public List getTag(String boardNo) throws SQLException;
	
	public List getTagList() throws SQLException;
	//showContent
	public QnaBoard showContent(String no) throws SQLException;
		
	//deleteBoard
	public void deleteBoard(int no) throws SQLException;
	
	//updateCount
	public void updateCount(String no) throws SQLException;
	
	//updateBoard
	public void updateBoard(QnaBoard vo) throws SQLException;
	
	
	
	public int countArticle(String keyword) throws SQLException ;
	
	public int isBoardLike(String userId, int boardNo,String likeStatus) throws SQLException;
	
	public int selectCntBoardLike(int boardNo) throws SQLException;
	
	public List<Integer> selectAllRecommendNo(String userId) throws SQLException;	
	
}














