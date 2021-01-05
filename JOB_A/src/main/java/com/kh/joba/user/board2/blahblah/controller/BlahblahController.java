package com.kh.joba.user.board2.blahblah.controller;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.joba.user.board2.blahblah.model.service.BlahblahService;
import com.kh.joba.user.attachment.model.vo.Attachment;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.comments2.model.service.Comments2Service;
import com.kh.joba.user.comments2.model.vo.Comments2;
import com.kh.joba.user.common.util.UtilsBoard1;

@Controller
public class BlahblahController {
	
	@Autowired
	BlahblahService bs;
	
	@Autowired
	Comments2Service cs;
	
	@RequestMapping("/board2/blahList.do")
	public String selectBlahBlahList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> list = bs.selectBlahBlahList(cPage, numPerPage);
		
		int totalContents = bs.selectBlahBlahTotalContents();
		
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "blahList.do");
		
		System.out.println("blahlist : " + list);
		
		model.addAttribute("blahList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/board/blahblah/blahList";
	}
	
	@RequestMapping("/board2/blahView.do")
	public String boardView(@RequestParam int board_No, Model model) {
		
		Board2 board = bs.selectOneBlah(board_No);
		List<Attachment> attachmentList = bs.selectAttachmentList(board_No);
		
		model.addAttribute("board2", board);
		model.addAttribute("attachmentList", attachmentList);
		
		List<Comments2> selectComment = cs.selectComment(board_No);
		model.addAttribute("selectComment", selectComment);
		
		return "user/board/blahblah/blahView";
	}
	
	@RequestMapping("/board2/blahDelete.do")
	public String blahDelete(@RequestParam int board_No, Model model) {
		
		int result = bs.blahDelete(board_No);
		
		String msg = "";
		String loc = "/board2/blahList.do";

		if (result > 0) {
			msg = "게시글 삭제 성공!";

		} else {
			msg = "게시글 삭제 실패";
		}

		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "user/common/msg";
	}
	
	@RequestMapping("/board2/blahForm.do")
	public String blahForm() {
		
		return "user/board/blahblah/blahForm";
	}
	
	@RequestMapping("/board2/insertBlah.do")
	public String insertBlah(Board2 board, /* @RequestParam int mem_No, */Model model) {
		
		int result = 0;
		System.out.println(board);
		/*
		 * System.out.println(mem_No); board.setMem_No(mem_No);
		 */
		result = bs.insertBlah(board);
		
		String msg = "";
		String loc = "/board2/blahList.do";

		if (result > 0) {
			msg = "게시글 작성 성공";
		} else {
			msg = " 게시글 작성 실패";
		}

		model.addAttribute("msg", msg).addAttribute("loc", loc);

		return "user/common/msg";
			
	}
	
	@RequestMapping("/board2/blahUpdateForm.do")
	public String bUpdateForm(@RequestParam int board_No, Model model) {
		
		System.out.println("<수정> 게시글 번호 : " + board_No);
		Board2 board = bs.selectOneBlah(board_No);
		
		System.out.println(board);

		model.addAttribute("board2", board);

		return "user/board/blahblah/blahUpdateForm";
	}
	
	
	@RequestMapping("/board2/updateBlah.do")
	public String updateBlah(@RequestParam int board_No, Board2 board, Model model) {
		
		System.out.println(board_No);
		System.out.println(board);
		
		Board2 originBoard = bs.selectOneBlah(board_No);
		
		System.out.println("수정할 값 확인 : "+board.getBoard_Title());
		System.out.println("수정할 값 확인 : "+board.getBoard_Content());
		
		originBoard.setBoard_Title(board.getBoard_Title());
		originBoard.setBoard_Content(board.getBoard_Content());
		
		int result = bs.updateBlah(originBoard);
		String msg = "";
		String loc = "/board2/blahView.do?board_No=" + board_No;

		if (result > 0) {
			msg = "게시글 수정 성공";
		} else {
			msg = " 게시글 수정 실패";
		}

		model.addAttribute("msg", msg).addAttribute("loc", loc);

		return "user/common/msg";
	}
	
	@RequestMapping("/board2/searchBlahList.do")
	public String searchBlahList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam String keyword,
			Model model) { 
		
		int numPerPage = 10;
		List<Map<String,String>> list = bs.searchBlahList(cPage, numPerPage, keyword);
		int totalContents = bs.searchBlahTotalContents(keyword);
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "searchBlahList.do?keyword="+keyword);
		
		// 조회확인용
		System.out.println("keyword : " + keyword);

	
		model.addAttribute("blahList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/board/blahblah/blahList"; 
	
	}
	


}
