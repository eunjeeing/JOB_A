package com.kh.joba.admin.index.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.joba.admin.index.model.service.IndexService;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;

@Controller
public class IndexController {
	
	@Autowired
	IndexService is;
	
	@RequestMapping("/adminIndex.do")
	public String adminIndex() {
		
		//System.out.println("admin페이지 연결완료");
		
		
		return "/adminIndex";
	}
	
	@RequestMapping(value = "/rankList", method = RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public String rankList(Model model) {
		
		System.out.println("rankList() 기능 실행");
		List<Map<String, String>> rankList =is.selectRank();
		model.addAttribute("count", rankList);
		
		return new Gson().toJson(rankList);
	}
	
	@RequestMapping(value="/carousel", method = RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public String carouselList(Model model) {
		
		System.out.println("carouselList() 기능 실행");
		List<Map<String, String>> carouselList = is.selectBoard();
		
		System.out.println("list :" + carouselList);
		model.addAttribute("carouselList", carouselList);
		
		return new Gson().toJson(carouselList);
	}
	
}
