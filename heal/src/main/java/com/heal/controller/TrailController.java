package com.heal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class TrailController {
	
	/* 지역 선택 페이지 */
	@RequestMapping(value="/trail/sidoMap")
	public String sidoMapForm() {
		return "trail/sidoMap";
	}
	
	/* 등산로 페이지 */
	@RequestMapping(value="/trail/trailMap")
	public String trailForm() {
		return "trail/trailMap";
	}
	
	
	
	
	
	
	
	
	
	
}
