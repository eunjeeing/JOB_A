package com.kh.joba.admin.index.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.joba.admin.index.model.service.IndexService;

@Controller
public class IndexController {
	
	@Autowired
	IndexService is;
	
	@RequestMapping("/adminIndex.do")
	public String adminIndex() {
		
		//System.out.println("admin페이지 연결완료");
		
		return "/adminIndex";
	}
	
	@RequestMapping("/ranking.do")
	public String rankList(Model model) {
		
		int count = is.selectRank();
		System.out.println("count: "+ count);
		model.addAttribute("count", count);
		
		return "/ranking";
	}
}
