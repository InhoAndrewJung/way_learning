package com.way.learning.model.board.qna.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.way.learning.model.board.qna.vo.QnaBoard;



@Repository
public class QnaBoardDAOImpl implements QnaBoardDAO{

	@Autowired
	private SqlSession sqlSession;

	public int insertBoard(QnaBoard bvo)throws SQLException{
		return sqlSession.insert("qnaBoardMapper.write",bvo);
	}

	//selectByNoForDate
	public Date selectByNoForDate(int no) throws SQLException{
		return sqlSession.selectOne("qnaBoardMapper.selectByNoForDate", no);
	}	
	
	//selectWriterActivity
	public int selectWriterActivity(String userId) throws SQLException{
		return sqlSession.selectOne("qnaBoardMapper.selectWriterActivity", userId);
	}	
	
	
	//getBoardList
	public List<QnaBoard> getBoardList(String pageNo,String keyword, String sorting) throws SQLException{
		Map<String,Object> map = new HashMap<String,Object>();

		map.put("keyword", keyword);
		map.put("pageNo", pageNo);
		map.put("sorting", sorting);
		System.out.println("다오에서 쏠팅:"+sorting);

		return sqlSession.selectList("qnaBoardMapper.getBoardList", map);
	}

	//getTagList	
	public List getTagList() throws SQLException{

		List taglist=sqlSession.selectList("qnaBoardMapper.getTagList");
		System.out.println("taglist::"+taglist);
		System.out.println("taglist size::"+taglist.size());
		return taglist;
	}

	public List getTag(String boardNo) throws SQLException{



		return sqlSession.selectList("qnaBoardMapper.getTag",boardNo);
	}

	public int deleteTag(int boardNo) throws SQLException{

		return sqlSession.delete("qnaBoardMapper.deleteTag",boardNo);
	}



	//showContent
	public QnaBoard showContent(String boardNo) throws SQLException{
		return sqlSession.selectOne("qnaBoardMapper.showContent",boardNo);
	}

	//deleteBoard
	public void deleteBoard(int no) throws SQLException{
		sqlSession.delete("qnaBoardMapper.deleteBoard",no);
	}
	//updateCount
	public void updateCount(String no) throws SQLException{
		sqlSession.update("qnaBoardMapper.updateCount",no);
	}

	//updateBoard
	public void updateBoard(QnaBoard vo) throws SQLException{
		sqlSession.update("qnaBoardMapper.updateBoard",vo);
	}

	//페이징 처리 추가...
	public int totalCount() throws SQLException{
		return sqlSession.selectOne("qnaBoardMapper.totalCount");
	}

	public int countArticle( String keyword) {



		return sqlSession.selectOne("qnaBoardMapper.countArticle",  keyword);
	}

	@Override
	public void insertTag(String tag, int boardNo) throws SQLException {
		Map<String,Object> map = new HashMap<String,Object>();

		map.put("tag", tag);
		map.put("boardNo", boardNo);

		sqlSession.insert("qnaBoardMapper.insertTag", map);

	}


	@Override
	public int isBoardLike(String userId, int boardNo,String likeStatus) throws SQLException {
		Map<String,Object> map = new HashMap<String,Object>();

		map.put("userId", userId);
		map.put("boardNo", boardNo);

		return sqlSession.selectOne("qnaBoardMapper.isBoardLike", map);

	}


	@Override
	public void insertBoardLike(String userId, int boardNo) throws SQLException {
		Map<String,Object> map = new HashMap<String,Object>();

		map.put("userId", userId);
		map.put("boardNo", boardNo);

		sqlSession.insert("qnaBoardMapper.insertBoardLike", map);

	}

	@Override
	public void deleteBoardLike(String userId, int boardNo) throws SQLException {
		Map<String,Object> map = new HashMap<String,Object>();

		map.put("userId", userId);
		map.put("boardNo", boardNo);

		sqlSession.delete("qnaBoardMapper.deleteBoardLike", map);

	}

	@Override
	public int increaseCntBoardLike(int boardNo) throws SQLException {

		System.out.println("총 좋아요 올리기:"+boardNo);
		return sqlSession.update("qnaBoardMapper.increaseCntBoardLike", boardNo);

	}


	@Override
	public int decreaseCntBoardLike(int boardNo) throws SQLException {

		System.out.println("총 좋아요 내리기:"+boardNo);
		return sqlSession.update("qnaBoardMapper.decreaseCntBoardLike", boardNo);

	}


	@Override
	public int selectCntBoardLike(int boardNo) throws SQLException {
		Map<String,Object> map = new HashMap<String,Object>();



		return sqlSession.selectOne("qnaBoardMapper.selectCntBoardLike", boardNo);

	}

	@Override
	public int selectBoardRecommendNo(String userId , int boardNo) throws SQLException {
		Map<String,Object> map = new HashMap<String,Object>();

		map.put("userId", userId);
		map.put("boardNo", boardNo);

		return sqlSession.selectOne("qnaBoardMapper.selectBoardRecommendNo", map);

	}









}




