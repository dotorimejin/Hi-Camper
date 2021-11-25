package com.heal.controller;

import java.io.PrintWriter;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

@Controller
@Slf4j
public class MemberController {
		
	@Autowired
	public MemberService memberService;
	
	/** 로그인 화면으로 이동 */
//	@RequestMapping("/member/loginForm")
//	public String loginForm() {
//		return "/member/loginForm";
//	}
	
	/** 로그인 화면으로 이동 */
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "/user/login";
	}
	
	/**로그인 */
	@RequestMapping("/login")
	public String login(String id, String pw, HttpSession session,HttpServletResponse response, @ModelAttribute("Member") Member vo)throws Exception  {

		String grade = memberService.login(id, pw);
		Member dto = memberService.loginToMember(id, pw);		

		/**
		//로그인 시간 보내기 
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		Date now = new Date(); 
		String now_dt = format.format(now);

		String last = now_dt.trim();
		//왜 안돼
		/int result = memberService.updateLastLogin(id, last);
		System.out.println("로그인 업데이트"+result);
		/////////////////////////////
		*/
		log.debug("dto :: " + dto);
	
			if(grade != null && dto != null  ) {
				session.setAttribute("id", id);
				session.setAttribute("grade", grade);
				session.setAttribute("dto", dto);
				if(grade.equals("A")) {
					log.debug("login admin Success :: ");
					return "redirect:/";
				} else {
					log.debug("login user Success :: ");
					return "redirect:/";
				}
			} else {
				//로그인 실패시 
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.append("<script>");out.append("alert('[안내] 로그인 후 이용 가능한 서비스 입니다.');");out.append("location.replace('/loginForm');");out.append("</script>");
				
				log.debug("login Fail :: ");
				return "/user/login";
			}
		
		
	
	}	
	
		
	/** 로그아웃 */
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.invalidate();
	   return "redirect:/";
	}

	/** 회원탈퇴 */
	@RequestMapping("/delete")
	public String deleteForm() {
		log.debug("deleteForm Load :: ");
		return "/member/deleteForm";
	}
	
	@RequestMapping("/deleteDone")
	public String deleteMember(String id, String pw) {
		log.debug("deleteMember Load :: ");
		log.debug(id + ", " + pw);
		boolean result = memberService.deleteMember(id, pw);
		if(result == true) {
			log.debug("deleteMember Success :: ");
			return "/member/deleteDone";
		} else {
			log.debug("deleteMember Fail :: ");
			return "/member/deleteForm";
		}
	}
}
