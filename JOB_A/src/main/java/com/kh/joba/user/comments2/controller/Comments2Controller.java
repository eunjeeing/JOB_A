package com.kh.joba.user.comments2.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.user.comments2.model.service.Comments2Service;
import com.kh.joba.user.comments2.model.vo.Comments2;


@Controller
public class Comments2Controller {
	
	@Autowired
	Comments2Service cs;
	
	@RequestMapping("/comments2/insertComment.do")
	public String insertComment(@RequestParam int board_No,
								@RequestParam int mem_No,
								@RequestParam String comm_Content,
								Comments2 comment, Model model) {
		
		int result = cs.insertComment(comment);
		
		String loc = "/board2/blahView.do?board_No="+board_No;
		String msg = "";
		
		model.addAttribute("loc", loc);
		
		return "user/common/pageMove";
	}
	
	@RequestMapping("/comments2/deleteComment.do")
	public String deleteComment(@RequestParam int board_No,
								@RequestParam int comm_No,
								HttpSession session,
								Comments2 comment, Model model) {
		
		int result = cs.deleteComment(comment);
		
		String loc = "/board2/blahView.do?board_No="+board_No;
		String msg = "";
		
		
		model.addAttribute("loc", loc);
		
		return "user/common/pageMove";
	}
	
	@RequestMapping("/comments2/updateComment.do")
	public String updateComment(@RequestParam int board_No,
								@RequestParam int comm_No,
								@RequestParam String comm_Content,
								Comments2 comment, Model model) {
		
		int result = cs.updateComment(comment);
		
		String loc = "/board2/blahView.do?board_No="+board_No;
		String msg = "";
		
		
		model.addAttribute("loc", loc);
		
		return "user/common/pageMove";
	}
	
}
