package com.kh.joba.user.board2.qna.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.user.attachment.model.vo.Attachment;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.board2.qna.model.service.QnAService;
import com.kh.joba.user.comments2.model.service.Comments2Service;
import com.kh.joba.user.comments2.model.vo.Comments2;
import com.kh.joba.user.common.util.UtilsBoard1;

@Controller
public class QnAController {
	
	@Autowired
	QnAService qs;
	
	@Autowired
	Comments2Service cs;
	
	@RequestMapping("/board2/selectQnAList.do")
	public String selectQnAList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> list = qs.selectQnAList(cPage, numPerPage);
		
		int totalContents = qs.selectQnATotalContents();
		
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "selectQnAList.do");
		
		System.out.println("selectQnAList : " + list);
		
		model.addAttribute("selectQnAList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/board/qna/qnaList";
	}
	
	@RequestMapping("/board2/qnaSelectOne.do")
	public String qnaSelectOne(@RequestParam int board_No, Model model) {
		
		Board2 board = qs.qnaSelectOne(board_No);
		List<Attachment> attachmentList = qs.selectAttachmentList(board_No);
		
		model.addAttribute("board2", board);
		model.addAttribute("attachmentList", attachmentList);
		
		List<Comments2> selectComment = cs.selectComment(board_No);
		model.addAttribute("selectComment", selectComment);
		
		return "user/board/qna/qnaView";
	}
	
	@RequestMapping("/board2/deleteQnA.do")
	public String deleteQnA(@RequestParam int board_No, Model model) {
		
		int result = qs.deleteQnA(board_No);
		
		String msg = "";
		String loc = "/board2/selectQnAList.do";

		if (result > 0) {
			msg = "게시글 삭제 성공!";

		} else {
			msg = "게시글 삭제 실패";
		}

		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "user/common/msg";
	}
	
	@RequestMapping("/board2/qnaForm.do")
	public String blindForm() {
		
		return "user/board/qna/qnaForm";
	}
	
	@RequestMapping("/board2/insertQnA.do")
	public String insertQnA(Board2 board, Model model) {
		
		int result = 0;
		System.out.println(board);

		result = qs.insertQnA(board);
		
		String msg = "";
		String loc = "/board2/selectQnAList.do";

		if (result > 0) {
			msg = "게시글 작성 성공";
		} else {
			msg = " 게시글 작성 실패";
		}

		model.addAttribute("msg", msg).addAttribute("loc", loc);

		return "user/common/msg";
			
	}
	
	@RequestMapping("/board2/qnaUpdateForm.do")
	public String qnaUpdateForm(@RequestParam int board_No, Model model) {
		
		System.out.println("<수정> 게시글 번호 : " + board_No);
		Board2 board = qs.qnaSelectOne(board_No);
		
		System.out.println(board);

		model.addAttribute("board2", board);

		return "user/board/qna/qnaUpdateForm";
	}
	
	
	@RequestMapping("/board2/updateQnA.do")
	public String updateQnA(@RequestParam int board_No, Board2 board, Model model) {
		
		System.out.println(board_No);
		System.out.println(board);
		
		Board2 originBoard = qs.qnaSelectOne(board_No);
		
		System.out.println("수정할 값 확인 : "+board.getBoard_Title());
		System.out.println("수정할 값 확인 : "+board.getBoard_Content());
		
		originBoard.setBoard_Title(board.getBoard_Title());
		originBoard.setBoard_Content(board.getBoard_Content());
		
		int result = qs.updateQnA(originBoard);
		String msg = "";
		String loc = "/board2/qnaSelectOne.do?board_No=" + board_No;

		if (result > 0) {
			msg = "게시글 수정 성공";
		} else {
			msg = " 게시글 수정 실패";
		}

		model.addAttribute("msg", msg).addAttribute("loc", loc);

		return "user/common/msg";
	}
	
	@RequestMapping("/board2/searchQnAList.do")
	public String searchQnAList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam String keyword,
			Model model) { 
		
		int numPerPage = 10;
		List<Map<String,String>> list = qs.searchQnAList(cPage, numPerPage, keyword);
		int totalContents = qs.searchQnATotalContents(keyword);
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "searchQnAList.do?keyword="+keyword);
		
		// 조회확인용
		System.out.println("keyword : " + keyword);

	
		model.addAttribute("selectQnAList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/board/qna/qnaList"; 
	
	}

}
