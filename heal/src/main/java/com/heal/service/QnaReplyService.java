package com.heal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.heal.dao.QnaReplyDao;
import com.heal.dto.QnaReply;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaReplyService {
	
	@Autowired
	private QnaReplyDao qnaReplyDao; 
	
	
	public List<QnaReply> replyList(int qnaNo) throws Exception{
		return qnaReplyDao.replyList(qnaNo);
	}

	public int insertReply(QnaReply reply) throws Exception{
		return qnaReplyDao.insertReply(reply);
	}

	public int updateReply(QnaReply reply) throws Exception{
		return qnaReplyDao.updateReply(reply);
	}

	public int deleteReply(int replyNo) throws Exception{
		return qnaReplyDao.deleteReply(replyNo);
	}

	
}
