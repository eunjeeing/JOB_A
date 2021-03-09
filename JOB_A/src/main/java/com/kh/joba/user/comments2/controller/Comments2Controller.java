package com.kh.joba.user.comments2.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.user.comments2.model.service.Comments2Service;
import com.kh.joba.user.comments2.model.vo.Comments2;


@Controller
public class Comments2Controller {
	
	@Autowired
	Comments2Service cs;
	
	// 댓글 추가
	@RequestMapping("/comments2/insertComment.do")
	public String insertComment(@RequestParam int board_No,
								@RequestParam int mem_No,
								@RequestParam String comm_Content,
								@RequestParam int type_No,
								Comments2 comment, Model model) {
		
		int result = cs.insertComment(comment);
		
		String msg = "";
		String loc = "";
		
		System.out.println("댓글 작성! 게시판 타입:" + type_No + " 게시글 번호:" + board_No + " 작성자:" + mem_No
				+ " 댓글 내용:" + comm_Content);
		
		if(type_No == 2) {
			loc = "/board2/jobSelectOne.do?board_No="+board_No;
		} else if(type_No == 4) {
			loc = "/board2/blahView.do?board_No="+board_No;
		} else if (type_No == 5) {
			loc = "/board2/blindSelectOne.do?board_No="+board_No;
		} else if (type_No == 6) {
			loc = "/selectOneTomorrow.bo?board_no="+board_No;
		} else if (type_No == 7) {
			loc = "/board2/qnaSelectOne.do?board_No="+board_No;
		} else if (type_No == 8) {
			loc = "/selectOneMento.bo?board_no="+board_No;
		} else if (type_No == 9) {
			loc = "/selectOneInterview.bo?board_no="+board_No;			
		} else if (type_No == 10) {
			loc = "/selectOneAccept.bo?board_no="+board_No;
		} else if (type_No == 11) {
			loc = "/adminNoticeView.bo?board_no=" + board_No;
		}
		
		model.addAttribute("loc", loc);
		
		return "user/common/pageMove";
	}
	
	@RequestMapping("/comments2/deleteComment.do")
	public String deleteComment(@RequestParam int board_No,
								@RequestParam int comm_No,
								@RequestParam int type_No,
								HttpSession session, 
								Comments2 comment, Model model) {
		
		int result = cs.deleteComment(comment);
		
		String loc = "";
		String msg = "";
		
		if(type_No == 2) {
			loc = "/board2/jobSelectOne.do?board_No="+board_No;
		} else if(type_No == 4) {
			loc = "/board2/blahView.do?board_No="+board_No;
		} else if (type_No == 5) {
			loc = "/board2/blindSelectOne.do?board_No="+board_No;
		} else if (type_No == 6) {
			loc = "/selectOneTomorrow.bo?board_no="+board_No;
		} else if (type_No == 7) {
			loc = "/board2/qnaSelectOne.do?board_No="+board_No;
		} else if (type_No == 8) {
			loc = "/selectOneMento.bo?board_no="+board_No;
		} else if (type_No == 9) {
			loc = "/selectOneInterview.bo?board_no="+board_No;			
		} else if (type_No == 10) {
			loc = "/selectOneAccept.bo?board_no="+board_No;
		} else if (type_No == 11) {
			loc = "/adminNoticeView.bo?board_no=" + board_No;
		}
		
		model.addAttribute("loc", loc);
		
		return "user/common/pageMove";
	}
	
	@RequestMapping("/comments2/updateComment.do")
	public String updateComment(@RequestParam int board_No,
								@RequestParam int comm_No,
								@RequestParam String comm_Content,
								@RequestParam int type_No,
								Comments2 comment, Model model) {
		
		int result = cs.updateComment(comment);

		System.out.println("댓글 업데이트 게시판 타입:" + type_No + " 게시글 번호:" + board_No + " 댓글번호:" + comm_No
				+ " 댓글 내용:" + comm_Content);
			
		String loc = "";
		String msg = "";
		
		if(type_No == 2) {
			loc = "/board2/jobSelectOne.do?board_No="+board_No;
		} else if(type_No == 4) {
			loc = "/board2/blahView.do?board_No="+board_No;
		} else if (type_No == 5) {
			loc = "/board2/blindSelectOne.do?board_No="+board_No;
		} else if (type_No == 6) {
			loc = "/selectOneTomorrow.bo?board_no="+board_No;
		} else if (type_No == 7) {
			loc = "/board2/qnaSelectOne.do?board_No="+board_No;
		} else if (type_No == 8) {
			loc = "/selectOneMento.bo?board_no="+board_No;
		} else if (type_No == 9) {
			loc = "/selectOneInterview.bo?board_no="+board_No;			
		} else if (type_No == 10) {
			loc = "/selectOneAccept.bo?board_no="+board_No;
		} else if (type_No == 11) {
			loc = "/adminNoticeView.bo?board_no=" + board_No;
		}
		
		model.addAttribute("loc", loc);
		
		return "user/common/pageMove";
	}
	

}
