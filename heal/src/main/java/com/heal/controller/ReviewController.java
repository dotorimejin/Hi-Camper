package com.heal.controller;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.heal.dto.Like;
import com.heal.dto.Review;
import com.heal.service.LikeService;
import com.heal.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

// 화면 사용자가 게시물을 클릭 -> 게시물 상세 페이지로 이동하면서, reviewController 호출 할때 re_no를 보내주면 -> 리뷰디테일 함수가 실행(re_no) -> dto
@Controller
@Slf4j
public class ReviewController {
	
	
	@Autowired
	public ReviewService reviewService;
	
	@Autowired
	public LikeService likeService;
	
	/** 목록 페이지 */
	@RequestMapping("/review/list")
	public String ReviewList(Model model) {
		log.info("### ReviewMember List :: ");
		
		ArrayList<Review> review = reviewService.reviewList();
		
		model.addAttribute("review", review);
		
		return "review/list";
	}
	
	
	/** 목록 페이지 좋아요 순 */
	@RequestMapping("/review/list/like")
	public String ReviewLikeList(Model model) {
		log.info("### ReviewMember List :: ");
		
		ArrayList<Review> review = reviewService.reviewLikeList();
		
		model.addAttribute("review", review);
		
		return "redirect:/review/list";
	}
	
	/** 게시글 상세조회 화면  */
	@RequestMapping("/review/detail")
	public String ReviewDetail(int re_no, String member_id, Model model) {
		log.info("### ReviewDetail :: ");
		
		Review dto = reviewService.findReviewDetail(re_no); // dto = 리뷰 데이터		
		
//		if(member_id == null) {
//			return "review/datail";
//		} else {
//			Like l = likeService.like(re_no, member_id);
//		}
		
		model.addAttribute("dto", dto);

		return "review/detail";
	}
	
	/** 게시글 삭제 */
	@RequestMapping("/review/delete")
	public String ReviewDelete(int re_no, Model model) {
		log.info("### Review Delete :: ");
		int result = reviewService.reviewDelete(re_no);
		if (result == 1) {
			return "review/deleteDone";
		} else {
			return "review/detail";
		}
	}
	
	/** 게시글 삭제 후 이동 페이지 */
	@RequestMapping("/review/deleteDone")
	public String DeleteDone() {
		return "review/deleteDone";
	}
	
	
		
	/** 게시글 수정화면 */
	@RequestMapping("/review/updateForm")
	public String ReviewUpdate(int re_no, Model model) {
		log.debug("### Review Update :: ");
		Review dto = reviewService.findReviewDetail(re_no);
		model.addAttribute("dto", dto);
		return "review/updateForm";
	}
	
	
	/** 게시글 수정 */
	@RequestMapping("/review/update")
	public String ReviewUpdate(Review dto, Model model) {
	
			int result = reviewService.updateReview(dto);
			if (result == 1) {
				return "review/formDone";
			} else {
				model.addAttribute("message", "수정 실패");
				log.debug("### error :: " + result);
				return "review/detail";
			}
		}
	
	
	
	/** 게시글 작성화면 */
	@RequestMapping("/review/form")
	public String ReviewForm() {
		log.info("### Review form ::");
		return "review/form";
	}

    /** 게시글 작성 */
	@RequestMapping("/review/formDone")
	public String ReviewWrite(Review dto, Model model, @RequestPart(value="re_img") MultipartFile files) {
		log.info("### Review Write :: ");
		log.debug("###" + dto);
		
	    String img = dto.getRe_img(); 
	    String uploadPath = "";
	    
	    String path = "../img/"; // 파일 업로드 경로
	        
	    System.out.println("#### img :: "+ img);        // text value
	    System.out.println("#### path :: " + path);    // file original name
	        
	    uploadPath = path + img ; // 파일 업로드 경로 + 파일 이름
	    
		int result = reviewService.insertReview(dto);
			if (result == 1) {
				return "review/formDone";
			} else {
				model.addAttribute("message", "작성 실패");
				return "review/list";
			}
	}
	
	/** 좋아요 추가 */
	@RequestMapping("/review/like{re_no}")
	public String Like(@PathVariable("re_no") int re_no,Review dto, Model model) {
		int result = reviewService.updateReviewLike(dto);
		
		System.out.println("#### dto :: " + dto);
		
		if (result == 1) {
			return "redirect:/review/detail?re_no={re_no}";
		} else {
			model.addAttribute("message", "로그인 필요");
			return "/login";
		}
	}
	
	/** 좋아요 취소 */
	@RequestMapping("/review/dislike{re_no}")
	public String DisLike(@PathVariable("re_no") int re_no, Review dto, Model model) {
		int result = reviewService.cancelReviewLike(re_no);
		int no = dto.getRe_no();
		dto.setRe_no(no);
		System.out.println("#### no :: " + no);
		
		System.out.println("#### dto :: " + dto);
		
		if (result == 1) {
			return "redirect:/review/detail?re_no={re_no}";
		} else {
			model.addAttribute("message", "로그인 필요");
			return "/login";
		}
	}
}
