package com.kh.joba.user.board2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("/board2/blahList.bo")
	public String selectBlahBlahList() {
		
		return "user/board/blahblah/blahList";
	}
	
	

}
