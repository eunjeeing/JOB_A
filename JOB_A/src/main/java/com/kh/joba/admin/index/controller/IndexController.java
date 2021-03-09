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
		
		System.out.println("rankList : " + rankList);
		model.addAttribute("rankList : ", rankList);
		
		return new Gson().toJson(rankList);
	}
	
	@RequestMapping(value="/carousel", method = RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public String carouselList(Model model) {
		
		//System.out.println("carouselList() 기능 실행");
		List<Map<String, String>> carouselList = is.selectBoard();
		
		System.out.println("carouselList :" + carouselList);
		model.addAttribute("carouselList : ", carouselList);
		
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
		
		System.out.println("BoardCount" + boardCount);
		model.addAttribute("BoardCount" + boardCount);
		
		return new Gson().toJson(boardCount);
	}
	
	// 오늘 게시글 카운트
	@RequestMapping(value="/todayBoardCount", method = RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public String boardTodayCount(Model model) {
		
		List<Map<String,String>> todayBoardCount = is.countTodayBoard();
		
		System.out.println("BoardCount" + todayBoardCount);
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
	// 총 회원수 카운트
	@RequestMapping(value="/totalMember", method = RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public String totalMember(Model model) {
		
		List<Map<String,String>> totalMember = is.countTotalMember();
		
		System.out.println("list" + totalMember);
		model.addAttribute("BoardCount" + totalMember);
			
			return new Gson().toJson(totalMember);
	}
	// 신고글 & 총 게시글 카운트
	@RequestMapping(value="/reportCount", method = RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public String reportCount(Model model) {
		
		List<Map<String,String>> reportCount = is.countReport();
		
		System.out.println("reportCount" + reportCount);
		model.addAttribute("reportCount" + reportCount);
			
			return new Gson().toJson(reportCount);
	}
	// 최근 게시글 가져오기..
	@RequestMapping(value="/recentBoard", method = RequestMethod.POST, produces="application/text;charset=utf-8")
	@ResponseBody
	public String recentBoard(Model model) {
		
		List<Map<String,String>> recentBoard = is.countResentB();
		
		System.out.println("noticeCount" + recentBoard);
		model.addAttribute("recentBoard" + recentBoard);
			
			return new Gson().toJson(recentBoard);
	}
	
}
