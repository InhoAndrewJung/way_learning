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
	public List<TechBoard> getBoardList(String no,String search_option, String keyword) throws SQLException{
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		map.put("boardNo", no);
		System.out.println("dao search_option:"+search_option);
		System.out.println("dao keyword:"+keyword);
		System.out.println("dao no:"+no);
		
		
		
		return sqlSession.selectList("techBoardMapper.getBoardList", map);
	}
	
	//showContent
	public TechBoard showContent(String no) throws SQLException{
		return sqlSession.selectOne("techBoardMapper.showContent",no);
	}
	
	//deleteBoard
	public void deleteBoard(String no) throws SQLException{
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
	
	public int countArticle(String search_option, String keyword) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return sqlSession.selectOne("techBoardMapper.countArticle",  map);
	}
	
	
}




