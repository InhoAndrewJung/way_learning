package com.way.learning.service.question;

import java.util.List;

import com.way.learning.model.board.qna.vo.QnaBoard;
import com.way.learning.model.question.vo.GeneralQuestion;

/**
 * 게시물 리스트 정보와 페이징 정보를 가지고 있는 클래스
 * 
 * @author inst
 * 
 */
public class ListVO {
	private List<GeneralQuestion> list; // 전체 게시글 다 가지고 있다!!!
	private PagingBean pagingBean; // 페이징빈 가지고 있다!!!

	public ListVO() {
		super();

	}

	public ListVO(List<GeneralQuestion> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}

	public List<GeneralQuestion> getList() {
		return list;
	}

	public void setList(List<GeneralQuestion> list) {
		this.list = list;
	}

	public PagingBean getPagingBean() {
		return pagingBean;
	}

	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	@Override
	public String toString() {
		return "ListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}

}
