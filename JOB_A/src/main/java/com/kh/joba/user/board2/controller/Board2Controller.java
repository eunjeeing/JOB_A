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
	Board2Service bs;
	
	@Autowired
	Comments2Service cs;
	
	@RequestMapping("/board2/blahList.do")
	public String selectBlahBlahList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> list = bs.selectBlahBlahList(cPage, numPerPage);
		
		int totalContents = bs.selectBlahBlahTotalContents();
		
		String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "blahList.do");
		
		System.out.println("blahlist : " + list);
		
		model.addAttribute("blahList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/board/blahblah/blahList";
	}
	
	@RequestMapping("/board2/blahView.do")
	public String boardView(@RequestParam int board_No, Model model) {
		
		Board2 board = bs.selectOneBlah(board_No);
		List<Attachment2> attachmentList = bs.selectAttachmentList(board_No);
		
		model.addAttribute("board2", board);
		model.addAttribute("attachmentList", attachmentList);
		
		List<Comments2> selectComment = cs.selectComment(board_No);
		model.addAttribute("selectComment", selectComment);
		System.out.println(selectComment);
		
		return "user/board/blahblah/blahView";
	}
	
	@RequestMapping("/board2/blahDelete.do")
	public String blahDelete(@RequestParam int board_No, Model model) {
		
		int result = bs.blahDelete(board_No);
		
		String msg = "";
		String loc = "/board2/blahList.do";

		if (result > 0) {
			msg = "게시글 삭제 성공!";

		} else {
			msg = "게시글 삭제 실패";
		}

		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "user/common/msg";
	}
	
	

}
