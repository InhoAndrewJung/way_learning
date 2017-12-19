package com.way.learning.service.board.qna;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.way.learning.model.board.qna.dao.QnaBoardDAO;
import com.way.learning.model.board.qna.vo.QnaBoard;


@Service
public class QnaBoardServiceImpl implements QnaBoardService{
	@Autowired
	private QnaBoardDAO qnaBoardDao;

	public int insertBoard(QnaBoard bvo)throws SQLException{
		System.out.println("Before BVO :: "+bvo.getBoardNo()); //0
		System.out.println("보드 서비스 bvo:"+bvo);
		int result=qnaBoardDao.insertBoard(bvo); //selectKey가 돌아가서 시퀀스를 vo에주입
		System.out.println("After BVO :: "+bvo.getBoardNo()); //3

		Date date=qnaBoardDao.selectByNoForDate(bvo.getBoardNo());//3
		
		//받아온 날짜를 bvo에 다시 세팅해준다...
		bvo.setRegDate(date);
		

		List<String> tag=bvo.getTag();

		for(String tags: tag){
			System.out.println("서비스 태그:"+tags);
			qnaBoardDao.insertTag(tags,bvo.getBoardNo());

		}
		return result;
	}
	
	//selectWriterActivity
		public int selectWriterActivity(String userId) throws SQLException{
			return qnaBoardDao.selectWriterActivity(userId);
		}	

	public List<QnaBoard> getBoardList(String Pageno,  String keyword, String sorting) throws SQLException{// no 

		return qnaBoardDao.getBoardList(Pageno,keyword, sorting);
	}

	public List getTagList() throws SQLException{

		return qnaBoardDao.getTagList();
	}

	@Override
	public List getTag(String boardNo) throws SQLException {
		// TODO Auto-generated method stub
		return qnaBoardDao.getTag(boardNo);
	}


	//showContent
	public QnaBoard showContent(String no) throws SQLException{

		return qnaBoardDao.showContent(no);
	}

	//deleteBoard
	public void deleteBoard(int no) throws SQLException{
		qnaBoardDao.deleteBoard(no);
	}

	//updateCount
	public void updateCount(String no) throws SQLException{
		qnaBoardDao.updateCount(no);
	}

	//updateBoard
	public void updateBoard(QnaBoard bvo) throws SQLException{
		qnaBoardDao.updateBoard(bvo);

		List<String> tag=bvo.getTag();
		qnaBoardDao.deleteTag(bvo.getBoardNo());

		for(String tags: tag){
			System.out.println("서비스 태그:"+tags);
			qnaBoardDao.insertTag(tags,bvo.getBoardNo());

		}
	}



	public int countArticle(String keyword) throws SQLException {

		return qnaBoardDao.countArticle(keyword);
	}

	@Transactional
	public int isBoardLike(String userId, int boardNo,String likeStatus) throws SQLException {
		int result=qnaBoardDao.isBoardLike(userId, boardNo, likeStatus);
		System.out.println("qna 서비스 isBoardLike likeStatus:"+likeStatus);
		System.out.println("qna 서비스 isBoardLike userId:"+userId);
		System.out.println("qna 서비스 isBoardLike boardNo:"+boardNo);
		System.out.println("qna 서비스 isBoardLike result:"+result);
		int action=0;
		if(likeStatus.equals("likeUp")){
			if(result==0){
				qnaBoardDao.insertBoardLike(userId, boardNo);
				action=qnaBoardDao.increaseCntBoardLike(boardNo);
			}

		}else if(likeStatus.equals("likeDown")){
			if(result==1){
				qnaBoardDao.deleteBoardLike(userId, boardNo);
				action=qnaBoardDao.decreaseCntBoardLike(boardNo);
			}

		}
		return action;

	}

	@Override
	public int selectCntBoardLike(int boardNo) throws SQLException {

		return qnaBoardDao.selectCntBoardLike(boardNo);

	}

	@Override
	public int selectBoardRecommendNo(String userId, int boardNo) throws SQLException {

		return qnaBoardDao.selectBoardRecommendNo(userId,boardNo);

	}







}