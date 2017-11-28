package com.way.learning.service.board.tech;

import java.io.File;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.way.learning.model.board.tech.dao.TechBoardDAO;
import com.way.learning.model.board.tech.vo.TechBoard;



@Service
public class TechBoardService {
	
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
	}
	
	public ListVO getBoardList(String Pageno, String search_option, String keyword) throws SQLException{// no 
		if(Pageno ==null || Pageno=="")  Pageno="1";//특정한 페이지를 클릭하지 않고 바로 최신 페이지로 들어가는 경우
		//페이징 처리시 수정되어야 하는 부분
		
		List<TechBoard> list=techBoardDao.getBoardList(Pageno,search_option,keyword);
		System.out.println("service 에서 list:"+list);
		int totalContent=techBoardDao.totalCount();
		System.out.println("service 에서 totalContent:"+totalContent);
		PagingBean pagingBean = new PagingBean(totalContent, Integer.parseInt(Pageno));
		ListVO lvo = new ListVO(list, pagingBean); //특정한 페이지에서 불러오는 전체 게시글임!!
		
		
		
		return lvo;
	}
	
	//showContent
	public TechBoard showContent(String no) throws SQLException{
		return techBoardDao.showContent(no);
	}
		
	//deleteBoard
	public void deleteBoard(String no) throws SQLException{
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
	
	
	
	public int countArticle(String search_option, String keyword) throws SQLException {
		
		return techBoardDao.countArticle(search_option, keyword);
	}
	
	
		
	
}














