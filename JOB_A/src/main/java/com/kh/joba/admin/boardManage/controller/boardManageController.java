package com.kh.joba.admin.boardManage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.admin.boardManage.model.service.boardManageService;
import com.kh.joba.user.common.util.UtilsBoard1;

@Controller
public class boardManageController {

	@Autowired
	boardManageService bms;
	
	// 게시판 리스트 출력
	// 채용공고
	@RequestMapping("/admin/jobList.do")
	public String jobList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
			
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> list = bms.selectJobList(cPage, numPerPage);
		
		int totalContents = bms.selectJobTotalContents();
		
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "jobList.do");
				
		model.addAttribute("jobList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
	
		return "admin/boardManage/jobList";
	}
	
	// 블라블라
	@RequestMapping("/admin/blahList.do")
	public String blahList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> list = bms.selectBlahBlahList(cPage, numPerPage);
		
		int totalContents = bms.selectBlahBlahTotalContents();
		
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "blahList.do");
				
		model.addAttribute("blahList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
	
		return "admin/boardManage/blahList";
	}
	
	// 블라인드
	@RequestMapping("/admin/blindList.do")
	public String blindList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> list = bms.selnctBlindList(cPage, numPerPage);
		
		int totalContents = bms.selectBlindTotalContents();
		
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "blindList.do");
				
		model.addAttribute("blindList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "admin/boardManage/blindList";
	}
	
	// 언틸투모로우
	@RequestMapping("/admin/tomoList.do")
	public String tomoList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> list = bms.selectTomoList(cPage, numPerPage);
		
		int totalContents = bms.selectTomoTotalContents();
		
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "tomoList.do");
				
		model.addAttribute("tomoList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "admin/boardManage/tomoList";
	}
	
	// Q&A
	@RequestMapping("/admin/qnaList.do")
	public String QnAList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> list = bms.selectQnAList(cPage, numPerPage);
		
		int totalContents = bms.selectQnATotalContents();
		
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "qnaList.do");
				
		model.addAttribute("qnaList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "admin/boardManage/qnaList";
	}
	
	// 합격후기
	@RequestMapping("/admin/acceptList.do")
	public String acceptList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		int numPerPage = 10;
		List<Map<String,String>> list = bms.selectAcceptList(cPage, numPerPage);
		int totalContents = bms.selectAcceptTotalContents();
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "acceptList.do");

		
		model.addAttribute("acceptList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "admin/boardManage/acceptList"; 
	}
	
	// 면접후기
	@RequestMapping("/admin/interviewList.do")
	public String interviewList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model) {
		int numPerPage = 10;
		List<Map<String,String>> list = bms.selectInterviewList(cPage, numPerPage);
		int totalContents = bms.selectInterviewTotalContents();
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "interviewList.do");
		
		model.addAttribute("interviewList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "admin/boardManage/interviewList"; 
	}
	
	// 멘토멘티
	@RequestMapping("/admin/mentoList.do")
	public String mentoList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			Model model) {
		int numPerPage = 10;
		List<Map<String,String>> list = bms.selectMentoList(cPage, numPerPage);
		int totalContents = bms.selectMentoTotalContents();
		
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "mentoList.do");

		
		model.addAttribute("mentoList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);

		return "admin/boardManage/mentoList"; 
	}
	
	// 서치
	@RequestMapping("/admin/searchJobList.do")
	public String searchJobList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam String keyword,
			Model model) { 
		
		int numPerPage = 10;
		List<Map<String,String>> list = bms.searchJobList(cPage, numPerPage, keyword);
		int totalContents = bms.searchJobTotalContents(keyword);
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "searchJobList.do?keyword="+keyword);
		

		model.addAttribute("jobList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "admin/boardManage/jobList"; 
	
	}
	
	
	// 게시글 블라인드 처리
	@RequestMapping("/admin/updateJobStatus.do")
	public String updateJobStatus(@RequestParam int board_No, Model model) {
		
		int result = bms.updateJobStatus(board_No);
		
		String msg = "";
		String loc = "/admin/jobList.do";

		if (result > 0) {
			msg = "블라인드 처리 완료";

		} else {
			msg = "블라인드 처리 실패";
		}

		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "user/common/msg";
	}
	
	



}
