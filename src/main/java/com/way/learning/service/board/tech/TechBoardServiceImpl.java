package com.way.learning.service.board.tech;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.way.learning.model.board.tech.dao.TechBoardDAO;
import com.way.learning.model.board.tech.vo.TechBoard;


@Service
public class TechBoardServiceImpl implements TechBoardService{
	@Autowired
	private TechBoardDAO techBoardDao;
	
	public void write(TechBoard bvo)throws SQLException{
		System.out.println("Before BVO :: "+bvo.getBoardNo()); //0
		System.out.println("보드 서비스 bvo:"+bvo);
		techBoardDao.write(bvo); //selectKey가 돌아가서 시퀀스를 vo에주입
		System.out.println("After BVO :: "+bvo.getBoardNo()); //3
		
		Date date=techBoardDao.selectByNoForDate(bvo.getBoardNo());//3
		//받아온 날짜를 bvo에 다시 세팅해준다...
		bvo.setRegDate(date);
		
		List<String> tag=bvo.getTag();
		
		for(String tags: tag){
			System.out.println("서비스 태그:"+tags);
			techBoardDao.insertTag(tags,bvo.getBoardNo());
			
		}
	}
	
	public List<TechBoard> getBoardList(String Pageno,  String keyword, String sorting) throws SQLException{// no 
		/*if(Pageno ==null || Pageno=="")  Pageno="1";*///특정한 페이지를 클릭하지 않고 바로 최신 페이지로 들어가는 경우
		//페이징 처리시 수정되어야 하는 부분
		
		
		
		
		
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
	public void updateBoard(TechBoard vo) throws SQLException{
		techBoardDao.updateBoard(vo);
	}
	
	
	
	public int countArticle(String keyword) throws SQLException {
		
		return techBoardDao.countArticle(keyword);
	}

	public void isBoardLike(String userId, int boardNo,String likeStatus) throws SQLException {
		int result=techBoardDao.isBoardLike(userId, boardNo, likeStatus);
		System.out.println("서비스 isBoardLike likeStatus:"+likeStatus);
		System.out.println("서비스 isBoardLike userId:"+userId);
		System.out.println("서비스 isBoardLike boardNo:"+boardNo);
		System.out.println("서비스 isBoardLike result:"+result);
		
		if(likeStatus.equals("likeUp")){
			if(result==0){
				techBoardDao.insertBoardLike(userId, boardNo);
				techBoardDao.increaseCntBoardLike(boardNo);
			}
			
		}else if(likeStatus.equals("likeDown")){
			if(result==1){
				techBoardDao.deleteBoardLike(userId, boardNo);
				techBoardDao.decreaseCntBoardLike(boardNo);
			}
			
		}
		
		
		
		
		
	}
	
	
	
	
		
	
}