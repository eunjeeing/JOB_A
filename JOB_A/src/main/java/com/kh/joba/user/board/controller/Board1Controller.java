package com.kh.joba.user.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.user.board.model.service.Board1Service;
import com.kh.joba.user.board.model.vo.Board1;
import com.kh.joba.user.common.util.UtilsBoard1;

@Controller
public class Board1Controller {
	
	@Autowired
	Board1Service bs;
	
	// *******************************************************************************************
	// 							Write Form Controller Area
	// *******************************************************************************************
	@RequestMapping("/noticeWrite.bo")
	public String noticeForm() {
		return "user/board/write/noticeWrite";
	}
	
	@RequestMapping("/commonWrite.bo")
	public String commonForm() {
		return "user/board/write/commonWrite";
	}
	
	@RequestMapping("/reviewWrite.bo")
	public String reviewForm() {
		return "user/board/write/reviewWrite";
	}
	
	
	// *******************************************************************************************
	// 							Notice Controller Area
	// *******************************************************************************************
	
	@RequestMapping("/notice.bo")
	public String noticeList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model) { 
		
		int numPerPage = 10;
		List<Map<String,String>> list = bs.selectNoticeList(cPage, numPerPage);
		int totalContents = bs.selectNoticeTotalContents();
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "notice.bo");
		
		// 조회확인용
		System.out.println("list : " + list);
		
		model.addAttribute("noticeList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "user/board/notice/notice"; 
	}
	@RequestMapping("/searchNotice.bo")
	public String searchNotice(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam String keyword,
			Model model) { 
		
		int numPerPage = 10;
		List<Map<String,String>> list = bs.searchNoticeList(cPage, numPerPage, keyword);
		int totalContents = bs.searchNoticeTotalContents(keyword);
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "searchNotice.bo?keyword="+keyword);
		
		// 조회확인용
		System.out.println("keyword : " + keyword);
		//System.out.println("totalContents : " + totalContents);
		//System.out.println("list : " + list);
	
		model.addAttribute("noticeList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		//model.addAttribute("keyword", keyword);
		
		return "user/board/notice/notice"; 
	}	
	@RequestMapping("/selectOneNotice.bo")
	public String selectOneNotice(@RequestParam int board_no, Model model) { 
		System.out.println("[selectOneNotice] board_no : " + board_no);
		Board1 notice = bs.selectOneNotice(board_no);
		//System.out.println("Notice : " + notice);
		model.addAttribute("notice", notice);

		return "user/board/notice/noticeView"; 
	}
	@RequestMapping("/updateViewNotice.bo")
	public String updateViewNotice(@RequestParam int board_no, Model model) {
		System.out.println("[updateNotice] board_no : " + board_no);
		Board1 notice = bs.updateViewNotice(board_no);
		model.addAttribute("notice", notice);
		
		return "user/board/notice/noticeUpdate";
	}
	@RequestMapping("/updateNotice.bo")
	public String updateNotice(Board1 notice, HttpServletRequest req, Model model) {
		
		int board_no = notice.getBoard_no();
		//System.out.println("[updateNotice] board_no : " + board_no);
		//System.out.println("[updateNotice] notice : " + notice);
		Board1 originalNotice = bs.updateViewNotice(board_no);
		originalNotice.setBoard_title(notice.getBoard_title());
		originalNotice.setBoard_content(notice.getBoard_content());
		
		//System.out.println("[updateNotice] changed Notice : " + originalNotice);
		int result = bs.updateNotice(notice);
		String loc = "/notice.bo";
		String msg = "";
		
		if (result > 0) {
			msg = "공지사항 수정 성공";
		} else {
			msg = "공지사항 수정 실패...";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "user/common/msg";
	}
	@RequestMapping("/deleteNotice.bo")
	public String deleteNotice(@RequestParam int board_no, Model model) {
		System.out.println("[deleteNotice] board_no : " + board_no);
		
		int result = bs.deleteNotice(board_no);
		
		String loc = "/notice.bo";
		String msg = "";
		
		if ( result > 0 ) {
			msg = "공지사항 삭제 완료";
		} else {
			msg = "공지사항 삭제 실패.";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "user/common/msg";
	}
	@RequestMapping("/insertNotice.bo")
	public String insertNotice(Board1 notice, Model model) {
		System.out.println("[insertNotice] board_title : " + notice.getBoard_title());
		int result = bs.insertNotice(notice);
		return "redirect:notice.bo";
		//return "user/common/msg";
	}

	// *******************************************************************************************
	// 							Mentoring Controller Area
	// *******************************************************************************************
	
	
	
	
	// *******************************************************************************************
	// 							UntilTomorrow Controller Area
	// *******************************************************************************************
	
	
	
	
	// *******************************************************************************************
	// 							InterviewReview Controller Area
	// *******************************************************************************************
	@RequestMapping("/interviewList.bo")
	public String interviewList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model) {
		int numPerPage = 10;
		List<Map<String,String>> list = bs.selectInterviewList(cPage, numPerPage);
		int totalContents = bs.selectInterviewTotalContents();
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "interviewList.bo");
		
		// 조회확인용
		//System.out.println("list : " + list);
		
		model.addAttribute("interviewList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "user/board/review/interview/interviewList"; 
	}
	
	@RequestMapping("/selectOneInterview.bo")
	public String selectOneInterview(@RequestParam int board_no, Model model) {
		
		System.out.println("Interview select One controller : " + board_no);
		
		return "redirect:interviewList.bo";
		//return "user/board/review/interview/interviewList";
	}
	
	// *******************************************************************************************
	// 							AcceptanceReview Controller Area
	// *******************************************************************************************
	@RequestMapping("/acceptList.bo")
	public String acceptList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model) {
		int numPerPage = 10;
		List<Map<String,String>> list = bs.selectAcceptList(cPage, numPerPage);
		int totalContents = bs.selectAcceptTotalContents();
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "acceptList.bo");
		
		// 조회확인용
		//System.out.println("list : " + list);
		
		model.addAttribute("acceptList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "user/board/review/acceptance/acceptList"; 
	}
	
	
}
