package com.heal.dao;

import java.util.ArrayList;


import java.util.List;



import org.apache.ibatis.annotations.Mapper;

import com.heal.dto.Review;


@Mapper
public interface ReviewDao {
	
	/** 게시판 전체조회 */
	public ArrayList<Review> reviewList();
	
	public ArrayList<Review> reviewLikeList();
	
	/** 게시글 세부조회 */
	public Review selectReviewDetail(int re_no);
	
	/** 게시글 등록 */
	public int insertReview (Review dto);
	
	/** 게시글 수정 */
	public int updateReview (Review dto);

	/** 게시글 삭제 */
	public int deleteReview (int re_no);

	/** 좋아요 추가 */
	public int updateReviewLike (Review dto);
	
	/** 좋아요 취소 */
	public int cancelReviewLike (int re_no);
	
}
