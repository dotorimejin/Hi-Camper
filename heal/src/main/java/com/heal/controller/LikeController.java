package com.heal.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.heal.dto.Like;
import com.heal.dto.Review;
import com.heal.service.LikeService;
import com.heal.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LikeController {
	
	@Autowired
	public ReviewService reviewService;
	
	@Autowired
	public LikeService likeService;
//	
//	
//	/** 좋아요  */
//	@RequestMapping("/review/detail/like")
//	public String Like(Like dto, Model model) {
//		likeService.likeCheck(dto);
//		int re_no = dto.getRe_no();
//		
//		int result = reviewService.updateReviewLike(dto);
//
//		return "/review/detail";
//	}
//	
//	/** 좋아요 취소 */
//	@RequestMapping("/review/detail/like/cancel")
//	public String LikeCancel(Like dto, Model model) {
//		likeService.likeCheckCancel(dto);
//		int re_no = dto.getRe_no();
//		int result = reviewService.updateReviewLike(dto);
//
//		return "/review/detail";
//	}
	
}
