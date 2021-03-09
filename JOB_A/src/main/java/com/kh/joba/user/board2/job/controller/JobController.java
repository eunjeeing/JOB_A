package com.kh.joba.user.board2.job.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.joba.user.attachment.model.vo.Attachment;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.board2.job.model.service.JobService;
import com.kh.joba.user.bookmark.model.service.BookmarkService;
import com.kh.joba.user.bookmark.model.vo.Bookmark;
import com.kh.joba.user.comments2.model.service.Comments2Service;
import com.kh.joba.user.comments2.model.vo.Comments2;
import com.kh.joba.user.common.util.UtilsBoard1;
import com.kh.joba.user.member.model.vo.Member;

@Controller
public class JobController {
	
	@Autowired
	JobService js;
	
	@Autowired
	Comments2Service cs;
	
	@Autowired
	BookmarkService ms;
	
	@RequestMapping("/board2/selectJobList.do")
	public String selectJobList(
			@RequestParam( value="cPage", required=false, defaultValue="1") int cPage, Model model) {
		
		int numPerPage = 10; // 한 페이지 당 게시글 and 페이지 수
		
		List<Map<String, String>> list = js.selectJobList(cPage, numPerPage);
		
		int totalContents = js.selectJobTotalContents();
		
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "selectJobList.do");
		
		System.out.println("selectJobList : " + list);
		
		model.addAttribute("selectJobList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/board/job/jobList";
	}
	
	@RequestMapping("/board2/jobSelectOne.do")
	public String jobSelectOne(@RequestParam int board_No, Model model, HttpSession session) {
		
		Board2 board = js.jobSelectOne(board_No);
		List<Attachment> attachmentList = js.selectAttachmentList(board_No);
		
		model.addAttribute("board2", board);
		model.addAttribute("attachmentList", attachmentList);
		
		List<Comments2> selectComment = cs.selectComment(board_No);
		model.addAttribute("selectComment", selectComment);
		
		Member mem = (Member)session.getAttribute("member");
		Bookmark isBookmark = new Bookmark(board_No, mem.getMemNo(), 0, null);
		Bookmark bookmark = ms.selectOneBookmark(isBookmark);
		
		model.addAttribute("bookmark", bookmark);
		
		return "user/board/job/jobView";
	}
	
	@RequestMapping("/board2/deleteJob.do")
	public String deleteJob(@RequestParam int board_No, Model model) {
		
		int result = js.deleteJob(board_No);
		
		String msg = "";
		String loc = "/board2/selectJobList.do";

		if (result > 0) {
			msg = "게시글 삭제 성공!";

		} else {
			msg = "게시글 삭제 실패";
		}

		model.addAttribute("msg", msg).addAttribute("loc", loc);
		
		return "user/common/msg";
	}
	
	@RequestMapping("/board2/jobForm.do")
	public String jobForm() {
		
		return "user/board/job/jobForm";
	}
	
	@RequestMapping("/board2/insertJob.do")
	public String insertJob(Board2 board, Model model) {
		
		int result = 0;
		System.out.println(board);

		result = js.insertJob(board);
		
		String msg = "";
		String loc = "/board2/selectJobList.do";

		if (result > 0) {
			msg = "게시글 작성 성공";
		} else {
			msg = " 게시글 작성 실패";
		}

		model.addAttribute("msg", msg).addAttribute("loc", loc);

		return "user/common/msg";
			
	}
	
	@RequestMapping("/board2/jobUpdateForm.do")
	public String jobUpdateForm(@RequestParam int board_No, Model model) {
		
		System.out.println("<수정> 게시글 번호 : " + board_No);
		Board2 board = js.jobSelectOne(board_No);
		
		System.out.println(board);

		model.addAttribute("board2", board);

		return "user/board/job/jobUpdateForm";
	}
	
	
	@RequestMapping("/board2/updateJob.do")
	public String updateQnA(@RequestParam int board_No, Board2 board, Model model) {
		
		Board2 originBoard = js.jobSelectOne(board_No);
		
		originBoard.setBoard_Title(board.getBoard_Title());
		originBoard.setBoard_Content(board.getBoard_Content());
		originBoard.setBoard_Url(board.getBoard_Url());
		originBoard.setBoard_Start(board.getBoard_Start());
		originBoard.setBoard_End(board.getBoard_End());
		originBoard.setBoard_Announce(board.getBoard_Announce());
		originBoard.setCategory_No(board.getCategory_No());
		
		
		int result = js.updateJob(originBoard);
		
		System.out.println("수정할 값 확인 :" + originBoard);

		String msg = "";
		String loc = "/board2/jobSelectOne.do?board_No=" + board_No;

		if (result > 0) {
			msg = "게시글 수정 성공";
		} else {
			msg = " 게시글 수정 실패";
		}

		model.addAttribute("msg", msg).addAttribute("loc", loc);

		return "user/common/msg";
	}
	
	@RequestMapping("/board2/searchJobList.do")
	public String searchJobList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam String keyword,
			Model model) { 
		
		int numPerPage = 10;
		List<Map<String,String>> list = js.searchJobList(cPage, numPerPage, keyword);
		int totalContents = js.searchJobTotalContents(keyword);
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "searchJobList.do?keyword="+keyword);
		
		System.out.println("keyword : " + keyword);

	
		model.addAttribute("selectJobList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/board/job/jobList"; 
	
	}
	
	@RequestMapping("/board2/categorySearch.do")
	public String categorySearch(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage,
			@RequestParam int category_No, Model model) {
		
		int numPerPage = 10;
		List<Map<String,String>> list = js.categorySearchJobList(cPage, numPerPage, category_No);
		int totalContents = js.categorySearchJobTotalContents(category_No);
		String pageBar = UtilsBoard1.getPageBar(totalContents, cPage, numPerPage, "categorySearch.do?category_No="+category_No);
			
		System.out.println("카테고리 번호 : " + category_No);
		
		model.addAttribute("selectJobList", list);
		model.addAttribute("totalContents", totalContents);
		model.addAttribute("numPerPage", numPerPage);
		model.addAttribute("pageBar", pageBar);
		
		return "user/board/job/jobList";

}

}