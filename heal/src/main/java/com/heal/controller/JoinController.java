package com.heal.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.heal.dto.Member;
import com.heal.service.MemberService;
import com.heal.util.BCrypt;
//import com.heal.util.SHA256;
import com.heal.util.SHA256;



@Controller
@RequestMapping("/member")
public class JoinController {

	@Autowired
	MemberService memberService;
	
	@GetMapping("joinPolicy")
	public String getJoinPolicy() {
		return "member/joinPolicy";
	}
	
	@PostMapping("joinPolicy")
	public String postJoinPolicy() {
		return "member/joinForm";
	}
	
	
	@PostMapping("join")
	public ModelAndView memberJoin(@ModelAttribute Member dto) {
		ModelAndView mav = new ModelAndView();
		int result = 0;
		//로그인 시간 보내기 
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd/HH:mm:ss"); 
		Date now = new Date(); 
		String now_dt = format.format(now);
		
		SimpleDateFormat today = new SimpleDateFormat("yyyy-MM-dd"); 
		Date today2 = new Date(); 
		String today3 = format.format(today2);

		String last = now_dt.trim();
		try {
			SHA256 sha = SHA256.getInsatnce();
			String shaPass1 = dto.getPw();
			String shaPass = sha.getSha256(shaPass1.getBytes());
			String bcPass= BCrypt.hashpw(shaPass, BCrypt.gensalt());
			dto.setPw(bcPass);
			dto.setLast_login(last);
			dto.setGrade("M");
			dto.setEntry_date(today3);
		}catch (Exception e) {
			e.printStackTrace();
		}	
		result = memberService.insertMember(dto);
		switch (result) {
		case 1:
			mav.setViewName("redirect:/login");
			break;

		default:
			mav.setViewName("member/joinForm");
			break;
		}
		return mav;
	}
	

	
}
