package com.kh.joba.user.mypage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.comments2.model.service.Comments2Service;
import com.kh.joba.user.common.util.UtilsBoard1;
import com.kh.joba.user.mypage.model.service.MypageService;

@Controller
public class MypageController {
	
	@Autowired
	MypageService ms;
	
	@Autowired
	Comments2Service cs;

	@RequestMapping("/mypage/selectMyPost.do")
	public String selectMyPost
		(@RequestParam( value="cPage", required=false, defaultValue="1") int cPage,
		 @RequestParam int mem_No, Model model) {
		
		int numPerPage = 10; 
		
		List<Map<String, String>> list = ms.selectMyPost(cPage, numPerPage, mem_No);
		
		int totalContents = ms.selectMyPostTotalContents(mem_No);
		
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "selectMyPost.do?mem_No="+mem_No);
		
		System.out.println("내가 쓴 게시글 조회 - 회원 번호 : " + mem_No);
		
		model.addAttribute("selectMyPost", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		
		return "user/mypage/myPost";
	}
	
	@RequestMapping("/mypage/selectMyComment.do")
	public String selectMyComment
		(@RequestParam( value="cPage", required=false, defaultValue="1") int cPage,
		 @RequestParam int mem_No, Model model) {
		
		int numPerPage = 10; 
		
		List<Map<String, String>> list = ms.selectMyComment(cPage, numPerPage, mem_No);
		
		int totalContents = ms.selectMyCommentTotalContents(mem_No);
		
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "selectMyComment.do?mem_No="+mem_No);
		
		System.out.println("내가 쓴 댓글 조회 - 회원 번호 : " + mem_No);
		
		model.addAttribute("selectMyComment", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		
		return "user/mypage/myComment";
	}
	
	@RequestMapping("/mypage/deleteChkPost.do")
	@ResponseBody
	public int deleteChkPost(@RequestParam(value = "chk[]") List<String> chArr, Board2 board) {
		
		System.out.println("deleteChkPost 컨트롤러 실행~");
		
		int result = 0;
		int board_No = 0;
				
		
		for(String i : chArr) {
			
			board_No = Integer.parseInt(i);
			board.setBoard_No(board_No);
			ms.deleteChkPost(board);
			}
		result = 1;
		
		
		return result;
	  }
	 
		
	
}
