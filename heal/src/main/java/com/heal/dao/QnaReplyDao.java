package com.heal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.heal.dto.QnaReply;

@Mapper
public interface QnaReplyDao {
	
	/* Q&A 댓글수 */
    public int replyCnt() throws Exception;
 
    /* Q&A 댓글 목록 */
    public List<QnaReply> replyList(int qnaNo) throws Exception;
 
    /* Q&A 댓글 작성 */
    public int insertReply(QnaReply reply) throws Exception;
    
    /* Q&A 댓글 수정 */
    public int updateReply(QnaReply reply) throws Exception;
 
    /* Q&A 댓글 삭제 */
    public int deleteReply(int replyNo) throws Exception;

}
