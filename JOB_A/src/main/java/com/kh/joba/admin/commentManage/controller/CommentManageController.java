package com.kh.joba.admin.commentManage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.admin.boardManage.model.service.boardManageService;
import com.kh.joba.admin.commentManage.model.service.CommentManageService;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.comments2.model.vo.Comments2;
import com.kh.joba.user.common.util.UtilsBoard1;

@Controller
public class CommentManageController {

	@Autowired
	CommentManageService cms;
	
	@Autowired
	boardManageService bms;
	
	// 댓글 리스트 출력
	// 채용공고
	@RequestMapping("/admin/jobCommentList.do")
	public String jobCommentList(Model model) {
					
		List<Map<String, String>> list = cms.jobCommentList();
						
		model.addAttribute("jobCommentList", list);
	
		return "admin/commentManage/jobCommentList";
	}
	
	// 블라블라
	@RequestMapping("/admin/blahCommentList.do")
	public String blahCommentList(Model model) {
					
		List<Map<String, String>> list = cms.blahCommentList();
								
		model.addAttribute("blahCommentList", list);
	
		return "admin/commentManage/blahCommentList";
	}
	
	// 블라인드
	@RequestMapping("/admin/blindCommentList.do")
	public String blindCommentList(Model model) {
					
		List<Map<String, String>> list = cms.blindCommentList();
		
		model.addAttribute("blindCommentList", list);
	
		return "admin/commentManage/blindCommentList";
	}
	
	// 언틸투모로우
	@RequestMapping("/admin/tomoCommentList.do")
	public String tomoCommentList(Model model) {
					
		List<Map<String, String>> list = cms.tomoCommentList();
								
		model.addAttribute("tomoCommentList", list);

		return "admin/commentManage/tomoCommentList";
	}
	
	// Q&A
	@RequestMapping("/admin/qnaCommentList.do")
	public String qnaCommentList(Model model) {
					
		List<Map<String, String>> list = cms.qnaCommentList();
								
		model.addAttribute("qnaCommentList", list);
	
		return "admin/commentManage/qnaCommentList";
	}
	
	// 합격후기
	@RequestMapping("/admin/acceptCommentList.do")
	public String acceptCommentList(Model model) {
					
		List<Map<String, String>> list = cms.acceptCommentList();
	
		model.addAttribute("acceptCommentList", list);
		
		return "admin/commentManage/acceptCommentList";
	}
	
	// 면접후기
	@RequestMapping("/admin/interviewCommentList.do")
	public String interviewCommentList( Model model) {
					
		List<Map<String, String>> list = cms.interviewCommentList();
						
		model.addAttribute("interviewCommentList", list);
	
		return "admin/commentManage/interviewCommentList";
	}
	
	// 멘토멘티
	@RequestMapping("/admin/mentoCommentList.do")
	public String mentoCommentList(Model model) {
					
		List<Map<String, String>> list = cms.mentoCommentList();
							
		model.addAttribute("mentoCommentList", list);
	
		return "admin/commentManage/mentoCommentList";
	}
	
	@RequestMapping("/admin/updateCommStatusY.do")
	public String updateCommStatusY(@RequestParam int comm_No, @RequestParam int type_No, Model model) {
		
		int result = cms.updateCommStatusY(comm_No, type_No);
		
		String msg = "";
		String loc = "";
		
		if (type_No == 2) {
			loc = "/admin/jobCommentList.do";
		} else if(type_No == 4) {
			loc = "/admin/blahCommentList.do";
		} else if (type_No == 5) {
			loc = "/admin/blindCommentList.do";
		} else if (type_No == 6) {
			loc = "/admin/tomoCommentList.do";
		} else if (type_No == 7) {
			loc = "/admin/qnaCommentList.do";
		} else if (type_No == 8) {
			loc = "/admin/mentoCommentList.do";
		} else if (type_No == 9) {
			loc = "/admin/interviewCommentList.do";
		} else if (type_No == 10) {
			loc = "/admin/acceptCommentList.do";
		}

		if (result > 0) {
			msg = "활성화 처리 완료";

		} else {
			msg = "활성화 처리 실패";
		}

		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "user/common/msg";
	}
	
	@RequestMapping("/admin/updateCommStatusB.do")
	public String updateCommStatusB(@RequestParam int comm_No, @RequestParam int type_No, Model model) {
		
		int result = cms.updateCommStatusB(comm_No, type_No);
		
		String msg = "";
		String loc = "";
		
		if (type_No == 2) {
			loc = "/admin/jobCommentList.do";
		} else if(type_No == 4) {
			loc = "/admin/blahCommentList.do";
		} else if (type_No == 5) {
			loc = "/admin/blindCommentList.do";
		} else if (type_No == 6) {
			loc = "/admin/tomoCommentList.do";
		} else if (type_No == 7) {
			loc = "/admin/qnaCommentList.do";
		} else if (type_No == 8) {
			loc = "/admin/mentoCommentList.do";
		} else if (type_No == 9) {
			loc = "/admin/interviewCommentList.do";
		} else if (type_No == 10) {
			loc = "/admin/acceptCommentList.do";
		}

		if (result > 0) {
			msg = "블라인드 처리 완료";

		} else {
			msg = "블라인드 처리 실패";
		}

		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "user/common/msg";
	}
	

}
