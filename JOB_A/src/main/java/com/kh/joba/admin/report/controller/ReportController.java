package com.kh.joba.admin.report.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.kh.joba.admin.report.model.service.ReportService;
import com.kh.joba.admin.report.model.service.ReportServiceImpl;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.member.model.vo.Member;

@SessionAttributes(value= {"member"})

@Controller
public class ReportController {

	@Autowired
	ReportService reportService;
	
	
	// 게시글 신고 리스트 페이지 접속
	@RequestMapping("boardReportList.do")
	public String boardReportList(Model model) {
		
		System.out.println("게시글 신고 리스트 페이지 접속 ok");
		
		List<Map<String, String>> list = reportService.selectReportList();
		System.out.println("reportList : " + list.toString());
		
		model.addAttribute("reportList", list);
		
		return "admin/report/boardReportList";
	}
	
	// 게시글 신고 
	@RequestMapping("insertReport.do")
	public String insertReport(String reason, int board2, int board2_no, Member member) {
		
				
		System.out.println("게시글 신고 리스트 페이지 접속 ok");
		System.out.println("사유"+reason);
		System.out.println("게시글"+board2);
		System.out.println("신고자"+member);
		System.out.println("게시글작성자"+board2_no);
		
		int res = reportService.insertReport(reason, board2, board2_no, member.getMemNo());
		System.out.println("res :" +res);
		
		return "user/board/blahblah/blahView";
	}

}
