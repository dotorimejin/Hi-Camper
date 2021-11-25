package com.heal.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	
	private String id;
	private String pw;
	private String nick;
	private String mobile;
	private String gender;
	private String age;
	private String grade;
	private String profile;
	private String last_login;
	private String entry_date;
	
	//파일 업로드
	private MultipartFile file;

	private String re_writer;
	private String member_id;
}
