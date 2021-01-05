package com.kh.joba.admin.index.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	@RequestMapping("/adminIndex.do")
	public String calendar() {
		
		System.out.println("admin페이지 연결완료");
		
		return "/adminIndex";
	}
}
