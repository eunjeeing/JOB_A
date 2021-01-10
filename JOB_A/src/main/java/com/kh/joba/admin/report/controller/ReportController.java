package com.kh.joba.admin.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReportController {

	
	// 게시글 신고 리스트 페이지 접속
	@RequestMapping("boardReportList.do")
	public String boardReportList() {
		
		System.out.println("게시글 신고 리스트 페이지 접속 ok");
		return "admin/report/boardReportList";
	}
	
}
