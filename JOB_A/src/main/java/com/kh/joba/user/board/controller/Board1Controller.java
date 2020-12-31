package com.kh.joba.user.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.user.board.model.service.Board1Service;
import com.kh.joba.user.board.model.vo.Board1;
import com.kh.joba.user.common.util.UtilsBoard1;

@Controller
public class Board1Controller {
	
	@Autowired
	Board1Service bs;
	
	// ***************
	// Notice
	// ***************
	
	@RequestMapping("/notice.bo")
	public String noticeList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model) { 
		
		int numPerPage = 10;
		List<Map<String,String>> list = bs.selectNoticeList(cPage, numPerPage);
		int totalContents = bs.selectNoticeTotalContents();
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "notice.bo");
		
		// 조회확인용
		System.out.println("list : " + list);
		
		model.addAttribute("noticeList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "user/board/notice/notice"; 
	}

	@RequestMapping("/searchNotice.bo")
	public String searchNotice(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam String keyword,
			Model model) { 
		
		int numPerPage = 10;
		List<Map<String,String>> list = bs.searchNoticeList(cPage, numPerPage, keyword);
		int totalContents = bs.searchNoticeTotalContents(keyword);
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "searchNotice.bo?keyword="+keyword);
		
		// 조회확인용
		System.out.println("keyword : " + keyword);
		//System.out.println("totalContents : " + totalContents);
		//System.out.println("list : " + list);
	
		model.addAttribute("noticeList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		//model.addAttribute("keyword", keyword);
		
		return "user/board/notice/notice"; 
	
	}
	
	@RequestMapping("/selectOneNotice.bo")
	public String selectOneNotice(@RequestParam int board_no, Model model) { 
		System.out.println("[selectOneNotice] board_no : " + board_no);
		Board1 notice = bs.selectOneNotice(board_no);
		//System.out.println("Notice : " + notice);
		model.addAttribute("notice", notice);

		return "user/board/notice/noticeView"; 
	}
	
	@RequestMapping("/updateNotice.bo")
	public String updateNotice(@RequestParam int board_no, Model model) {
		System.out.println("[updateNotice] board_no : " + board_no);
		Board1 notice = bs.selectOneNotice(board_no);
		model.addAttribute("notice", notice);
		
		return "user/board/notice/noticeUpdate";
	}
	
	
	@RequestMapping("/deleteNotice.bo")
	public String deleteNotice(@RequestParam int board_no, Model model) {
		System.out.println("[deleteNotice] board_no : " + board_no);
		
		return "user/board/notice/noticeUpdate";
	}
	
	
}
