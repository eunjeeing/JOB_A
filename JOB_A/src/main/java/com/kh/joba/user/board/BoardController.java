package com.kh.joba.user.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	@RequestMapping("/notice.bo")
	public String noticeList() { return "user/board/notice/notice"; }
}
