package com.kh.joba.admin.report.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.joba.admin.report.model.service.ReportService;
import com.kh.joba.admin.report.model.service.ReportServiceImpl;
import com.kh.joba.admin.report.model.vo.Report;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.comments2.model.vo.Comments2;
import com.kh.joba.user.member.model.vo.Member;


@SessionAttributes(value= {"member"})

@Controller
public class ReportController {

	@Autowired
	ReportService reportService;
	
	
	// 게시글 신고 리스트 페이지 접속
	@RequestMapping("boardReportList.do")
	public String boardReportList(Model model) {
		
		System.out.println("게시글 신고 리스트 페이지 접속 ok");
		
		List<Report> list = reportService.selectReportList(); 	// 신고된 게시글 조회
		List<Board2> boardList = new ArrayList<Board2>(); 		// 게시글 제목 가져 올 경로.
		List<Member> reporterList = new ArrayList<Member>(); 	// 신고자 ID 가지고 오기
		List<Member> appendantList = new ArrayList<Member>(); 	// 피신고자 ID 가지고 오기

		System.out.println("reportList : " + list.toString());
		
		for(Report report : list ) {
			
			Board2 board2 = reportService.selectBoardList(report.getBoardNo());
			
			Member reporter = reportService.selectMember(report.getMemNo());
			Member appendant = reportService.selectMember(report.getMemNo2());

			System.out.println("board2 : " + board2.toString());
			System.out.println("reporter : " + reporter.toString());
			System.out.println("appendant : " + appendant.toString());
			
			boardList.add(board2);
			reporterList.add(reporter);
			appendantList.add(appendant);
		}
			
		
		model.addAttribute("reportList", list);
		model.addAttribute("boardList", boardList);
		model.addAttribute("reporterList", reporterList);
		model.addAttribute("appendantList", appendantList);
		
		return "admin/report/boardReportList";
	}
	
	// 댓글, 게시글 신고 
	@RequestMapping("insertReport.do")
	public String insertReport(HttpServletRequest request, RedirectAttributes redirectAttributes, String reason, int board2, int board2_no, int modal_separate,  Member member) {
		
		System.out.println("게시글 신고 리스트 페이지 접속 ok");
		System.out.println("사유"+reason);
		System.out.println("게시글"+board2);
		System.out.println("신고자"+member);
		System.out.println("게시글작성자"+board2_no);
		System.out.println("댓글 게시글 구분(1이면 게시글 2이면 댓글) : " + modal_separate);
		
		String referer = request.getHeader("Referer"); // 이전 페이지 돌아가기
		
		// 중복 신고 체크
		Report reportCheck = new Report(member.getMemNo(),board2) ;	
		
		Report rp = reportService.selectReportCheck(reportCheck); 
		
		System.out.println(" 중복 신고 체크 중 신고내용 :"+ rp);
				
			if(modal_separate == 1 && rp == null) {
				//게시글일때
				Report report = new Report( member.getMemNo(), board2, reason, board2_no);
				
				int res = reportService.insertReport(report);
				System.out.println("res :" +res);
				
				if(res>0) {
					System.out.println("여기 들어오면 게시글 신고됨");
					
					reportService.updateBoardReportNum(board2); // 신고 횟수 업데이트 
					
					 redirectAttributes.addFlashAttribute("check", "true"); // check 데이터 안담김
					 return "redirect:"+ referer;
				} else {
					System.out.println("여기 들어오면 게시글 신고 안됨");
					redirectAttributes.addFlashAttribute("check", "false");
					return "redirect:"+ referer;
				}
				
			}else if(modal_separate == 2 && rp == null) {
				//댓글일때
				Report report = new Report( member.getMemNo(), 0, board2, reason, board2_no);
	
				int res = reportService.insertReport(report);
				System.out.println("res :" +res);
							
				if(res>0) {
					System.out.println("여기 들어오면 댓글 신고됨");
					
					reportService.updateCommentReportNum(board2); // 신고 횟수 업데이트 
					redirectAttributes.addFlashAttribute("check", "true");
					return "redirect:"+ referer;
					
				} else {
					System.out.println("여기 들어오면 댓글 신고 안됨");
					redirectAttributes.addFlashAttribute("check", "false");
					return "redirect:"+ referer;
				}
	
			}

		return "redirect:"+ referer;
		
	}

	// 신고 게시글 상세 페이지 접속
	@RequestMapping("boardReportDetail.do")
	public String boardReportDetail(Model model, int boardNo, String reportReason, String appendantMemNick, String reporterMemNick) {
		
		System.out.println("여기는 컨트롤러 boardNo:"+ boardNo +"reportReason:"+ reportReason+"appendantMemNick:"+appendantMemNick+"reporterMemNick:"+reporterMemNick);
		
		Board2 board2 = reportService.selectBoardList(boardNo);
		System.out.println("board2 : " + board2.toString());
		
		String boardType = reportService.selectBoardType(board2.getType_No());
		System.out.println("boardType : " + boardType);
		
		
		model.addAttribute("boardList", board2);
		model.addAttribute("reportReason", reportReason);
		model.addAttribute("appendantMemNick", appendantMemNick);
		model.addAttribute("reporterMemNick", reporterMemNick);
		model.addAttribute("boardType", boardType); // 게시판 타입 String으로 변경
		
		return "admin/report/boardReportDetail";
	}
	
	//신고 게시글 업데이트
	@RequestMapping("boardReportUpdate.do")
	public String boardReportUpdate(Model model, int boardNo, String boardStatus) {
		
		System.out.println("게시글업데이트 boardNo:"+boardNo);
		System.out.println("게시글업데이트 boardStatus:"+boardStatus);
		
		int res = reportService.updateBoard(boardNo, boardStatus);
		
		if(res > 0) { // 업데이트 성공시
			return "redirect:boardReportList.do";
			
		}else { // 업데이트 실패시
			
			return "redirect:boardReportList.do"; 
			
		}
		
	}
		
	// 댓글 신고 리스트 페이지 접속
	@RequestMapping("commentReportList.do")
	public String commentReportList(Model model) {

		System.out.println("댓글 신고 리스트");
		
		List<Report> list = reportService.selectCommentList(); 	// 신고된 댓글 조회
		
		List<Comments2> commentList = new ArrayList<Comments2>(); // 댓글 내용 가져 올 경로.
		List<Member> reporterList = new ArrayList<Member>(); 	// 신고자 ID 가지고 오기
		List<Member> appendantList = new ArrayList<Member>(); 	// 피신고자 ID 가지고 오기
		List<Board2> board2List = new ArrayList<Board2>(); 		// 게시글 정보 조회
		
		for(Report report : list) {
			
			Comments2 comments2 = reportService.selectComment(report.getCommNo()); // 해당 댓글 정보 조회
			
			Board2 board2 = reportService.selectBoardList(comments2.getBoard_No()); // 해당 게시글 정보 조회
			
			Member reporter = reportService.selectMember(report.getMemNo());
			Member appendant = reportService.selectMember(report.getMemNo2());

			System.out.println("comments2 : " + comments2.toString());
			System.out.println("reporter : " + reporter.toString());
			System.out.println("appendant : " + appendant.toString());
			System.out.println("board2 : " + board2.toString());
			
			commentList.add(comments2);
			reporterList.add(reporter);
			appendantList.add(appendant);
			board2List.add(board2);
			
		}
			
		
		model.addAttribute("reportList", list);
		model.addAttribute("commentList", commentList);
		model.addAttribute("reporterList", reporterList);
		model.addAttribute("appendantList", appendantList);
		model.addAttribute("board2List", board2List);
		
		return "admin/report/commentReportList";
				
	}

}
