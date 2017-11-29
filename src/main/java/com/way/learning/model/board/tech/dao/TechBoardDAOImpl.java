package com.way.learning.model.board.tech.dao;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.way.learning.model.board.tech.vo.TechBoard;



@Repository
public class TechBoardDAOImpl implements TechBoardDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	public int write(TechBoard bvo)throws SQLException{
		return sqlSession.insert("techBoardMapper.write",bvo);
	}
	
	//selectByNoForDate
	public Date selectByNoForDate(int no) throws SQLException{
		return sqlSession.selectOne("techBoardMapper.selectByNoForDate", no);
	}	
	//getBoardList
	public List<TechBoard> getBoardList(String pageNo,String keyword, String sorting) throws SQLException{
		Map<String,Object> map = new HashMap<String,Object>();
	
		map.put("keyword", keyword);
		map.put("pageNo", pageNo);
		map.put("sorting", sorting);
		System.out.println("다오에서 쏠팅:"+sorting);
	
		return sqlSession.selectList("techBoardMapper.getBoardList", map);
	}
	
	//getTagList	
	public List getTagList() throws SQLException{

		List taglist=sqlSession.selectList("techBoardMapper.getTagList");
		System.out.println("taglist::"+taglist);
		System.out.println("taglist size::"+taglist.size());
		return taglist;
	}
	
	public List getTag(String boardNo) throws SQLException{

		
		
		return sqlSession.selectList("techBoardMapper.getTag",boardNo);
	}
	
	//showContent
	public TechBoard showContent(String boardNo) throws SQLException{
		return sqlSession.selectOne("techBoardMapper.showContent",boardNo);
	}
	
	//deleteBoard
	public void deleteBoard(int no) throws SQLException{
		 sqlSession.delete("techBoardMapper.deleteBoard",no);
	}
	//updateCount
	public void updateCount(String no) throws SQLException{
		 sqlSession.update("techBoardMapper.updateCount",no);
	}
	
	//updateBoard
	public void updateBoard(TechBoard vo) throws SQLException{
		 sqlSession.update("techBoardMapper.updateBoard",vo);
	}
	
	//페이징 처리 추가...
	public int totalCount() throws SQLException{
		return sqlSession.selectOne("techBoardMapper.totalCount");
	}
	
	public int countArticle( String keyword) {
	
		
	
		return sqlSession.selectOne("techBoardMapper.countArticle",  keyword);
	}

	@Override
	public void insertTag(String tag, int boardNo) throws SQLException {
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("tag", tag);
		map.put("boardNo", boardNo);
		
		sqlSession.insert("techBoardMapper.insertTag", map);
		
	}
	
	
	@Override
	public int isBoardLike(String userId, int boardNo,String likeStatus) throws SQLException {
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("userId", userId);
		map.put("boardNo", boardNo);
		
		return sqlSession.selectOne("techBoardMapper.isBoardLike", map);
		
	}
	
	
	@Override
	public void insertBoardLike(String userId, int boardNo) throws SQLException {
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("userId", userId);
		map.put("boardNo", boardNo);
		
		 sqlSession.insert("techBoardMapper.insertBoardLike", map);
		
	}
	
	@Override
	public void deleteBoardLike(String userId, int boardNo) throws SQLException {
		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("userId", userId);
		map.put("boardNo", boardNo);
		
		 sqlSession.delete("techBoardMapper.deleteBoardLike", map);
		
	}
	
	@Override
	public void increaseCntBoardLike(int boardNo) throws SQLException {
		
		System.out.println("총 좋아요 올리기:"+boardNo);
		 sqlSession.update("techBoardMapper.increaseCntBoardLike", boardNo);
		
	}
	
	
	@Override
	public void decreaseCntBoardLike(int boardNo) throws SQLException {
		
		System.out.println("총 좋아요 내리기:"+boardNo);
		 sqlSession.update("techBoardMapper.decreaseCntBoardLike", boardNo);
		
	}
	
	
	@Override
	public int selectCntBoardLike(int boardNo) throws SQLException {
		Map<String,Object> map = new HashMap<String,Object>();
		
	
		
		return sqlSession.selectOne("techBoardMapper.selectCntBoardLike", boardNo);
		
	}
	
	
	
	
	
	
	
	
	
}




