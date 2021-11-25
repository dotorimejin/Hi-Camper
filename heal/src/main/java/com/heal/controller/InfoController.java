package com.heal.controller;

import java.io.IOException;

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


@Controller
@RequestMapping("/member")
public class InfoController {
	@Autowired
	MemberService memberService;
	
	
	@GetMapping("/info")
	public ModelAndView getInfo(@ModelAttribute Member dto, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		Member login = (Member) session.getAttribute("login");
		
		if(login ==null) {
			mav.setViewName("/member/loginForm");
			return mav;
		}
		
		//Member vo = memberService.memberSelect(login.getId());
		mav.addObject("member",dto);
		mav.setViewName("/member/updateForm");
		
		return mav;
	}
	
	@PostMapping("/update")
	public ModelAndView updatePOST(@ModelAttribute("Member") Member dto, HttpSession session, HttpServletRequest request ) throws IOException {
		ModelAndView mav = new ModelAndView();
		Member login= (Member) session.getAttribute("login");
		Member vo = memberService.memberSelect(login.getId());
		if(dto.getProfile() != null) {
	//		String profile = FileUploadUtil.fileUpload(dto.getFile(), request, "member");
	//		dto.setProfile(profile);
		}else {
			mav.setViewName("/member/Update");
			return mav;
		}
		if(memberService.updateMember(dto)) {
			mav.setViewName("/member/info");
			return mav;
		}
		return mav;
	}
	
	
}
