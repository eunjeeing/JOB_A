package com.kh.joba.user.comments2.controller;

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
	Comments2Service commentsService;
	
	@RequestMapping("/comments2/insertComment.bo")
	public String insertComment(@RequestParam int board_No,
								@RequestParam int mem_No,
								@RequestParam String comm_Content,
								Comments2 comment, Model model) {
		
		int result = commentsService.insertComment(comment);
		
		String loc = "/board2/blahView.bo?board_No="+board_No;
		String msg = "";
		if( result > 0 ) {
			msg = "댓글이 등록되었습니다.";
		} else {
			msg = "댓글이 등록되지 않았습니다.";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "user/common/msg";
	}
	
}
