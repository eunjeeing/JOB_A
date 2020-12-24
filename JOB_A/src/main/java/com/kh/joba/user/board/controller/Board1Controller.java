package com.kh.joba.user.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Board1Controller {
	
	//@Autowired
	//Board1Service boardservice;
	
	@RequestMapping("/notice.bo")
	public String noticeList() { return "user/board/notice/notice"; }

}
