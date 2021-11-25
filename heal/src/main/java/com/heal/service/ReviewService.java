package com.heal.service;

import java.util.ArrayList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.heal.dao.ReviewDao;
import com.heal.dto.Review;
import com.heal.util.Utility;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ReviewService {

	@Autowired
	private ReviewDao reviewDao;

	
	/** 게시글 전체조회 */
	public ArrayList<Review> reviewList() {
		return reviewDao.reviewList();
	}

	/** 게시글 좋아요 순으로 조회 */
	public ArrayList<Review> reviewLikeList() {
		return reviewDao.reviewLikeList();
	}
	
	/** 게시글 상세조회 */
	public Review findReviewDetail(int re_no) {
		return reviewDao.selectReviewDetail(re_no);
	}

	/** 게시글 작성 */
	public int insertReview(Review dto) {
		dto.setRe_date(Utility.getCurrentDate());
		int result = reviewDao.insertReview(dto);
		log.debug("dao result: " + result);
		return result;
	}


	/** 게시글 수정 */
	public int updateReview(Review dto) {
		dto.setRe_date(Utility.getCurrentDate());
		int result = reviewDao.updateReview(dto);
		log.debug("dao result: " + result);
		return result;
	}

	
	/** 게시글 삭제 */
	public int reviewDelete(int re_no) {
		log.debug("### Review Delete :: ");
		int result = reviewDao.deleteReview(re_no);
		return result;
	}

	/** 좋아요 추가 */
	public int updateReviewLike(Review dto) {
		//dto.setRe_date(Utility.getCurrentDate());
		int result = reviewDao.updateReviewLike(dto);
		log.debug("dao result: " + result);
		return result;
	}

	
	/** 좋아요 취소 */
	public int cancelReviewLike(int re_no) {
		int result = reviewDao.cancelReviewLike(re_no);
		return result;
	}


	
}
