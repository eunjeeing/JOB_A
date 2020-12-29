package com.kh.joba.user.board2.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.user.board2.model.service.Board2Service;
import com.kh.joba.user.board2.model.vo.Attachment2;
import com.kh.joba.user.board2.model.vo.Board2;
import com.kh.joba.user.comments2.model.service.Comments2Service;
import com.kh.joba.user.comments2.model.vo.Comments2;
import com.kh.joba.user.common.util.Utils;

@Controller
public class Board2Controller {
	
	@Autowired
	Board2Service boardService;
	
	@Autowired
	Comments2Service commentsService;
	
	@RequestMapping("/board2/blahList.bo")
	public String selectBlahBlahList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> list = boardService.selectBlahBlahList(cPage, numPerPage);
		
		int totalContents = boardService.selectBlahBlahTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "blahList.bo");
		
		System.out.println("blahlist : " + list);
		
		model.addAttribute("blahList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/board/blahblah/blahList";
	}
	
	@RequestMapping("/board2/blahView.bo")
	public String boardView(@RequestParam int no, Model model) {
		
		Board2 board = boardService.selectOneBlah(no);
		List<Attachment2> attachmentList = boardService.selectAttachmentList(no);
		
		model.addAttribute("board2", board);
		model.addAttribute("attachmentList", attachmentList);
		
		List<Comments2> selectComment = commentsService.selectComment(no);
		model.addAttribute("selectComment", selectComment);
		System.out.println(selectComment);
		
		return "user/board/blahblah/blahView";
	}
	

}
