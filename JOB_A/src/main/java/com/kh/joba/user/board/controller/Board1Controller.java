package com.kh.joba.user.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.user.board.model.service.Board1Service;
import com.kh.joba.user.common.util.UtilsBoard1;

@Controller
public class Board1Controller {
	
	@Autowired
	Board1Service bs;
	
	@RequestMapping("/board/notice.bo")
	public String noticeList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) { 
		
		int numPerPage = 10;
		List<Map<String,String>> list = bs.selectBoardList(cPage, numPerPage);
		int totalContents = bs.selectBoardTotalContents();
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
	public String searchNotice() { return "user/board/notice/notice"; }
	
	
}
