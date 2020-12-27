package com.kh.joba.user.board2.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.user.board2.model.service.Board2Service;
import com.kh.joba.user.common.util.Utils;

@Controller
public class Board2Controller {
	
	@Autowired
	Board2Service boardService;
	
	@RequestMapping("/board2/blahList.bo")
	public String selectBlahBlahList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> list = boardService.selectBlahBlahList(cPage, numPerPage);
		
		int totalContents = boardService.selectBlahBlahTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "blahList.bo");
		
		System.out.println("list : " + list);
		
		model.addAttribute("blahList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/board/blahblah/blahList";
	}
	
	

}
