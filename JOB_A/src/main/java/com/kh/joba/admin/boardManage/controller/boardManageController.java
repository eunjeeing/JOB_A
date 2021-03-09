package com.kh.joba.admin.boardManage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.admin.boardManage.model.service.boardManageService;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.comments2.model.service.Comments2Service;
import com.kh.joba.user.comments2.model.vo.Comments2;

@Controller
public class boardManageController {

	@Autowired
	boardManageService bms;
	
	// 게시판 리스트 출력
	// 채용공고
	@RequestMapping("/admin/jobList.do")
	public String jobList(Model model) {
					
		List<Map<String, String>> list = bms.selectJobList();
		
		model.addAttribute("jobList", list);

		return "admin/boardManage/jobList";
	}
	
	// 블라블라
	@RequestMapping("/admin/blahList.do")
	public String blahList(Model model) {
				
		List<Map<String, String>> list = bms.selectBlahBlahList();
								
		model.addAttribute("blahList", list);
	
		return "admin/boardManage/blahList";
	}
	
	// 블라인드
	@RequestMapping("/admin/blindList.do")
	public String blindList(Model model) {
				
		List<Map<String, String>> list = bms.selnctBlindList();
								
		model.addAttribute("blindList", list);
		
		return "admin/boardManage/blindList";
	}
	
	// 언틸투모로우
	@RequestMapping("/admin/tomoList.do")
	public String tomoList(Model model) {
				
		List<Map<String, String>> list = bms.selectTomoList();
								
		model.addAttribute("tomoList", list);
		
		return "admin/boardManage/tomoList";
	}
	
	// Q&A
	@RequestMapping("/admin/qnaList.do")
	public String QnAList(Model model) {
				
		List<Map<String, String>> list = bms.selectQnAList();
								
		model.addAttribute("qnaList", list);

		return "admin/boardManage/qnaList";
	}
	
	// 합격후기
	@RequestMapping("/admin/acceptList.do")
	public String acceptList(Model model) {
		
		List<Map<String,String>> list = bms.selectAcceptList();

		model.addAttribute("acceptList", list);

		return "admin/boardManage/acceptList"; 
	}
	
	// 면접후기
	@RequestMapping("/admin/interviewList.do")
	public String interviewList(Model model) {
		
		List<Map<String,String>> list = bms.selectInterviewList();
		
		model.addAttribute("interviewList", list);

		return "admin/boardManage/interviewList"; 
	}
	
	// 멘토멘티
	@RequestMapping("/admin/mentoList.do")
	public String mentoList(Model model) {
		
		List<Map<String,String>> list = bms.selectMentoList();
		
		model.addAttribute("mentoList", list);


		return "admin/boardManage/mentoList"; 
	}
	
	@RequestMapping("/admin/updateStatusY.do")
	public String updateStatusY(@RequestParam int board_No, @RequestParam int type_No, Model model) {
		
		int result = bms.updateStatusY(board_No, type_No);
		
		String msg = "";
		String loc = "";
		
		if (type_No == 2) {
			loc = "/admin/jobList.do";
		} else if(type_No == 4) {
			loc = "/admin/blahList.do";
		} else if (type_No == 5) {
			loc = "/admin/blindList.do";
		} else if (type_No == 6) {
			loc = "/admin/tomoList.do";
		} else if (type_No == 7) {
			loc = "/admin/qnaList.do";
		} else if (type_No == 8) {
			loc = "/admin/mentoList.do";
		} else if (type_No == 9) {
			loc = "/admin/interviewList.do";
		} else if (type_No == 10) {
			loc = "/admin/acceptList.do";
		} else if (type_No == 1) {
			loc = "/admin/noticeList.bo";
		}

		if (result > 0) {
			msg = "활성화 처리 완료";

		} else {
			msg = "활성화 처리 실패";
		}

		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "user/common/msg";
	}
	
	@RequestMapping("/admin/updateStatusB.do")
	public String updateStatusB(@RequestParam int board_No, @RequestParam int type_No, Model model) {
		
		int result = bms.updateStatusB(board_No, type_No);
		
		String msg = "";
		String loc = "";
		
		if (type_No == 2) {
			loc = "/admin/jobList.do";
		} else if(type_No == 4) {
			loc = "/admin/blahList.do";
		} else if (type_No == 5) {
			loc = "/admin/blindList.do";
		} else if (type_No == 6) {
			loc = "/admin/tomoList.do";
		} else if (type_No == 7) {
			loc = "/admin/qnaList.do";
		} else if (type_No == 8) {
			loc = "/admin/mentoList.do";
		} else if (type_No == 9) {
			loc = "/admin/interviewList.do";
		} else if (type_No == 10) {
			loc = "/admin/acceptList.do";
		} else if (type_No == 1) {
			loc = "/admin/noticeList.bo";
		}

		if (result > 0) {
			msg = "블라인드 처리 완료";

		} else {
			msg = "블라인드 처리 실패";
		}

		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "user/common/msg";
	}
	
	@RequestMapping("/admin/selectOneBoard.do")
	public String selectOneBoard(@RequestParam int board_No, Model model) {
		
		Board2 selectOneBoard = bms.selectOneBoard(board_No);
		System.out.println(selectOneBoard);

		List<Comments2> commentList = bms.selectComment(board_No);
		
		model.addAttribute("board2", selectOneBoard);
		model.addAttribute("commentList", commentList);

		
		return "admin/boardManage/selectOneBoard";
	}

}
