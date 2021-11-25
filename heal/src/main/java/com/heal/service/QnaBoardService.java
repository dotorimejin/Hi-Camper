package com.heal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heal.controller.QnaBoardController;
import com.heal.dao.QnaBoardDao;
import com.heal.dto.QnaBoard;

import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class QnaBoardService {
	
	@Autowired
	private QnaBoardDao qnaBoardDao;
	
	
	/* Q&A 전체 조회 */
	public List<QnaBoard> boardList() {
		return qnaBoardDao.boardList();
	}
	
	/* Q&A  상세 조회 */
	public QnaBoard boardDetail(int qnaNo) {
		qnaBoardDao.updateViewCnt(qnaNo);
		return qnaBoardDao.boardDetail(qnaNo);
	}
	
	/* Q&A 글 추가 */
	public int insertBoard(QnaBoard qnaBoard) {
		return qnaBoardDao.insertBoard(qnaBoard);
	}
	
	/* Q&A 글 수정 */
	public int updateBoard(QnaBoard qnaBoard) {
		return qnaBoardDao.updateBoard(qnaBoard);
	}
	
	/* Q&A 게시판 글 삭제 */
	public int deleteBoard(int qnaNo) {
		return qnaBoardDao.deleteBoard(qnaNo);
	}
	
	
	/* Q&A 검색 */
	
}
