package com.kh.joba.admin.commentManage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.admin.commentManage.model.service.CommentManageService;
import com.kh.joba.user.common.util.UtilsBoard1;

@Controller
public class CommentManageController {

	@Autowired
	CommentManageService cms;
	
	// 댓글 리스트 출력
	// 채용공고
	@RequestMapping("/admin/jobCommentList.do")
	public String jobCommentList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
			
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> list = cms.jobCommentList(cPage, numPerPage);
		
		int totalContents = cms.jobCommentTotalContents();
		
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "jobCommentList.do");
				
		model.addAttribute("jobCommentList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
	
		return "admin/commentManage/jobCommentList";
	}
	
	// 블라블라
	@RequestMapping("/admin/blahCommentList.do")
	public String blahCommentList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
			
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> list = cms.blahCommentList(cPage, numPerPage);
		
		int totalContents = cms.blahCommentTotalContents();
		
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "blahCommentList.do");
				
		model.addAttribute("blahCommentList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
	
		return "admin/commentManage/blahCommentList";
	}
	
	// 블라인드
	@RequestMapping("/admin/blindCommentList.do")
	public String blindCommentList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
			
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> list = cms.blindCommentList(cPage, numPerPage);
		
		int totalContents = cms.blindCommentTotalContents();
		
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "blindCommentList.do");
				
		model.addAttribute("blindCommentList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
	
		return "admin/commentManage/blindCommentList";
	}
	
	// 언틸투모로우
	@RequestMapping("/admin/tomoCommentList.do")
	public String tomoCommentList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
			
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> list = cms.tomoCommentList(cPage, numPerPage);
		
		int totalContents = cms.tomoCommentTotalContents();
		
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "tomoCommentList.do");
				
		model.addAttribute("tomoCommentList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
	
		return "admin/commentManage/tomoCommentList";
	}
	
	// Q&A
	@RequestMapping("/admin/qnaCommentList.do")
	public String qnaCommentList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
			
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> list = cms.qnaCommentList(cPage, numPerPage);
		
		int totalContents = cms.qnaCommentTotalContents();
		
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "qnaCommentList.do");
				
		model.addAttribute("qnaCommentList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
	
		return "admin/commentManage/qnaCommentList";
	}
	
	// 합격후기
	@RequestMapping("/admin/acceptCommentList.do")
	public String acceptCommentList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
			
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> list = cms.acceptCommentList(cPage, numPerPage);
		
		int totalContents = cms.acceptCommentTotalContents();
		
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "acceptCommentList.do");
				
		model.addAttribute("acceptCommentList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
	
		return "admin/commentManage/acceptCommentList";
	}
	
	// 면접후기
	@RequestMapping("/admin/interviewCommentList.do")
	public String interviewCommentList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
			
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> list = cms.interviewCommentList(cPage, numPerPage);
		
		int totalContents = cms.interviewCommentTotalContents();
		
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "interviewCommentList.do");
				
		model.addAttribute("interviewCommentList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
	
		return "admin/commentManage/interviewCommentList";
	}
	
	// 멘토멘티
	@RequestMapping("/admin/mentoCommentList.do")
	public String mentoCommentList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
			
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> list = cms.mentoCommentList(cPage, numPerPage);
		
		int totalContents = cms.mentoCommentTotalContents();
		
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "mentoCommentList.do");
				
		model.addAttribute("mentoCommentList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
	
		return "admin/commentManage/mentoCommentList";
	}
}
