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
	/************************/
	/*		사용자 인덱스		*/
	/************************/
	@RequestMapping(value = "/rankList", method = RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public String rankList(Model model) {
		
		System.out.println("rankList() 기능 실행");
		List<Map<String, String>> rankList =is.selectRank();
		
		System.out.println("list :" + rankList);
		model.addAttribute("rankList", rankList);
		
		return new Gson().toJson(rankList);
	}
	
	@RequestMapping(value="/carousel", method = RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public String carouselList(Model model) {
		
		//System.out.println("carouselList() 기능 실행");
		List<Map<String, String>> carouselList = is.selectBoard();
		
		System.out.println("list :" + carouselList);
		model.addAttribute("carouselList", carouselList);
		
		return new Gson().toJson(carouselList);
	}
	
	
	
	/************************/
	/*		관리자 인덱스		*/
	/************************/
	
	// 전체 게시글 카운트	
	@RequestMapping(value="/boardCount", method = RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public String boardCount(Model model) {
		
		List<Map<String,String>> boardCount = is.countBoard();
		
		System.out.println("list" + boardCount);
		model.addAttribute("BoardCount" + boardCount);
		
		return new Gson().toJson(boardCount);
	}
	
	// 오늘 게시글 카운트
	@RequestMapping(value="/todayBoardCount", method = RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public String boardTodayCount(Model model) {
		
		List<Map<String,String>> todayBoardCount = is.countTodayBoard();
		
		System.out.println("list" + todayBoardCount);
		model.addAttribute("BoardCount" + todayBoardCount);
		
		return new Gson().toJson(todayBoardCount);
	}
	
	// 오늘 가입자 카운트
	@RequestMapping(value="/todayMember", method = RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public String todayMember(Model model) {
		
		List<Map<String,String>> todayMember = is.countTodayMember();
		
		System.out.println("list" + todayMember);
		model.addAttribute("BoardCount" + todayMember);
			
			return new Gson().toJson(todayMember);
	}
	
	@RequestMapping(value="/totalMember", method = RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public String totalMember(Model model) {
		
		List<Map<String,String>> totalMember = is.countTotalMember();
		
		System.out.println("list" + totalMember);
		model.addAttribute("BoardCount" + totalMember);
			
			return new Gson().toJson(totalMember);
	}
}
