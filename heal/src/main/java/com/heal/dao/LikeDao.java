package com.heal.dao;

import org.apache.ibatis.annotations.Mapper;

import com.heal.dto.Like;

@Mapper
public interface LikeDao {

	/** 게시글 수정 */
	public int likeCheck (Like dto);

	/** 게시글 삭제 */
	public int likeCheckCancel (Like dto);
	
	public Like like (int re_no, String member_id);
	
}
