package com.way.learning.service.board.tech;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.way.learning.model.board.tech.dao.TechBoardDAO;
import com.way.learning.model.board.tech.vo.TechBoard;


@Service
public class TechBoardServiceImpl implements TechBoardService{
	@Autowired
	private TechBoardDAO techBoardDao;
	
	public int insertBoard(TechBoard bvo)throws SQLException{
		System.out.println("Before BVO :: "+bvo.getBoardNo()); //0
		System.out.println("보드 서비스 bvo:"+bvo);
		int result=techBoardDao.insertBoard(bvo); //selectKey가 돌아가서 시퀀스를 vo에주입
		System.out.println("After BVO :: "+bvo.getBoardNo()); //3
		
		Date date=techBoardDao.selectByNoForDate(bvo.getBoardNo());//3
		//받아온 날짜를 bvo에 다시 세팅해준다...
		bvo.setRegDate(date);
		
		List<String> tag=bvo.getTag();
		
		for(String tags: tag){
			System.out.println("서비스 태그:"+tags);
			techBoardDao.insertTag(tags,bvo.getBoardNo());
			
		}
		return result;
	}
	
	public int selectWriterActivity(String userId) throws SQLException{
		return techBoardDao.selectWriterActivity(userId);
	}	
	
	public List<TechBoard> getBoardList(String Pageno,  String keyword, String sorting) throws SQLException{// no 
		
		return techBoardDao.getBoardList(Pageno,keyword, sorting);
	}
	
	public List getTagList() throws SQLException{
		
		return techBoardDao.getTagList();
	}
	
	@Override
	public List getTag(String boardNo) throws SQLException {
		// TODO Auto-generated method stub
		return techBoardDao.getTag(boardNo);
	}
	
	
	//showContent
	public TechBoard showContent(String no) throws SQLException{
		
		return techBoardDao.showContent(no);
	}
		
	//deleteBoard
	public void deleteBoard(int no) throws SQLException{
		techBoardDao.deleteBoard(no);
	}
	
	//updateCount
	public void updateCount(String no) throws SQLException{
		techBoardDao.updateCount(no);
	}
	
	//updateBoard
	public void updateBoard(TechBoard bvo) throws SQLException{
		techBoardDao.updateBoard(bvo);
		List<String> tag=bvo.getTag();
		techBoardDao.deleteTag(bvo.getBoardNo());

		for(String tags: tag){
			System.out.println("서비스 태그:"+tags);
			techBoardDao.insertTag(tags,bvo.getBoardNo());

		}
	}
	
	
	
	public int countArticle(String keyword) throws SQLException {
		
		return techBoardDao.countArticle(keyword);
	}
	
	@Transactional
	public int isBoardLike(String userId, int boardNo) throws SQLException {
		int result=techBoardDao.isBoardLike(userId, boardNo);
		
		System.out.println("tech 서비스 isBoardLike userId:"+userId);
		System.out.println("tech 서비스 isBoardLike boardNo:"+boardNo);
		System.out.println("tech 서비스 isBoardLike result:"+result);
		int action=0;
		
			if(result==0){
				techBoardDao.insertBoardLike(userId, boardNo);
				action=techBoardDao.increaseCntBoardLike(boardNo);
		
			
	
			}else if(result==1){
				techBoardDao.deleteBoardLike(userId, boardNo);
				action=techBoardDao.decreaseCntBoardLike(boardNo);
			}
			
		
		return action;
	
	}
	
	@Override
	public int selectCntBoardLike(int boardNo) throws SQLException {

		return techBoardDao.selectCntBoardLike(boardNo);
		
	}
	
	@Override
	public int selectBoardRecommendNo(String userId, int boardNo) throws Exception {

		return techBoardDao.selectBoardRecommendNo(userId,boardNo);
		
	}

	
	
	
	
		
	
}