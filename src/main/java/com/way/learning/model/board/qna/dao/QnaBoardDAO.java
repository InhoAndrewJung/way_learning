package com.way.learning.model.board.qna.dao;

import java.sql.SQLException;
import java.util.Date;

import java.util.List;
import com.way.learning.model.board.qna.vo.QnaBoard;




public interface QnaBoardDAO {

	

	
	public int insertBoard(QnaBoard bvo)throws SQLException;
	
	//selectByNoForDate
	public Date selectByNoForDate(int no) throws SQLException;
	//getBoardList
	public List<QnaBoard> getBoardList(String pageNo, String keyword, String sorting) throws SQLException;
	
	public List getTag(String boardNo) throws SQLException;
	//showContent
	public QnaBoard showContent(String no) throws SQLException;
	//deleteBoard
	public void deleteBoard(int no) throws SQLException;
	//updateCount
	public void updateCount(String no) throws SQLException;
	
	//updateBoard
	public void updateBoard(QnaBoard vo) throws SQLException;
	
	//페이징 처리 추가...
	public int totalCount() throws SQLException;

	
	public int countArticle( String keyword)throws SQLException;
	
	public void insertTag(String tag,int boardNo)throws SQLException;
		
	public List getTagList() throws SQLException;
	
	public int isBoardLike(String userId, int boardNo,String likeStatus) throws SQLException;
	
	public void insertBoardLike(String userId, int boardNo) throws SQLException;
	
	public void deleteBoardLike(String userId, int boardNo) throws SQLException;
	
	public int increaseCntBoardLike(int boardNo) throws SQLException;
	
	public int decreaseCntBoardLike(int boardNo) throws SQLException;
	
	public int selectCntBoardLike(int boardNo) throws SQLException;
	
	
	public List<Integer> selectAllRecommendNo(int boardNo) throws SQLException;
	
}




















