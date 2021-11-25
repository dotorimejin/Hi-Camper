package com.heal.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.heal.util.SHA256;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member")
public class LoginController {
	@Autowired
	MemberService memberService;

	@GetMapping("/login")
	public String getLogin() {
		return "/member/loginForm";
	}

	@PostMapping("/userLogin")
	public ModelAndView postLogin(@ModelAttribute("Member") Member dto, HttpSession session, HttpServletRequest request,String id) {
		int result = 0;

		ModelAndView mav = new ModelAndView();

		
		// 로그인 시간 보내기
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd/HH:mm:ss");
		Date now = new Date();
		String now_dt = format.format(now);
		String last_login = now_dt.trim();
	
		 
		// 활성화 여부
		result = memberService.userLogin(dto);
		switch (result) {
		case 1:
			// 로그인 실패
			System.out.println("아이디 없음");
			mav.addObject("errCode", 1);
			mav.setViewName("login/login");
			break;

		default:
			log.debug("dto :: " + dto);
			SHA256 sha = new SHA256();
			String shaPass = null;
			try {
				shaPass = sha.getSha256(dto.getPw().getBytes());
			} catch (Exception e) {
				e.printStackTrace();
			}
			Member login = memberService.userPw(dto);// 입력

			// 로그인
			if (!BCrypt.checkpw(shaPass, login.getPw())) {
				mav.addObject("errCode", 3);
				mav.setViewName("/member/login");
				mav.addObject("errCode", 3);// 비밀번호 다름
				// return mav;
			} else {
				log.debug("dto :: " + dto);
				// 로그인 성공
				session.setAttribute("login", login);
				session.setAttribute("id", id);
				memberService.updateLastLogin(last_login, id);
				mav.setViewName("redirect:/");
			}
		}
		return mav;

	}

}
