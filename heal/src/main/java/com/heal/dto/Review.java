 package com.heal.dto;

 import lombok.AllArgsConstructor;

 import lombok.Builder;
 import lombok.Data;
 import lombok.NoArgsConstructor;

 @Data
 @Builder
 @NoArgsConstructor
 @AllArgsConstructor
 public class Review {
 	
	private int re_no;

 	private String re_writer;
 	
 	private String re_title;
 	
 	private String re_content;

 	private String re_img;
 	
 	private String re_star;
 	
 	private String re_date;
 	
 	private String re_like;
 	
 	private String id;
 	
 	private String member_id;
 	
 	private String like_check;
 }