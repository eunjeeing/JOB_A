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
	public String insertReport(HttpServletRequest request, Model model, String reason, int board2, int board2_no, int modal_separate,  Member member) {
		
		System.out.println("게시글 신고 리스트 페이지 접속 ok");
		System.out.println("사유"+reason);
		System.out.println("게시글"+board2);
		System.out.println("신고자"+member);
		System.out.println("게시글작성자"+board2_no);
		System.out.println("댓글 게시글 구분(1이면 게시글 2이면 댓글) : " + modal_separate);
		
		
		// 중복 신고 체크
		//Report reportCheck = new Report(member.getMemNo(),board2);	
		
		//Report rp = reportService.selectReportCheck(reportCheck); 
		
		
		//인서트 결과
		String result = "X";
		//게시글 타입
		int boardType = 0;
		//페이지이동
        String loc = "/login.do";
        String msg = "";
        //게시글 번호
        int boardNo = 0;

        	if(modal_separate == 1) {
        		
        		// 중복 신고 체크
        		Report reportCheck = new Report(member.getMemNo(),board2);	
        		
        		Report rp = reportService.selectReportCheck(reportCheck);
        		System.out.println(" 중복 신고 체크 중 신고내용 :"+ rp);

        		//게시글일때
        		if(rp == null) {
        			
        			//신고가 없을 때
        			Report report = new Report( member.getMemNo(), board2, reason, board2_no);
    				
    				boardType = reportService.selectBoardTypeNo(board2); 
    				System.out.println("게시판 타입"+boardType);
    				
    				int res = reportService.insertReport(report);
    				System.out.println("res :" +res);
    				
    				if(res>0) {
    					System.out.println("여기 들어오면 게시글 신고됨");
    					
    					reportService.updateBoardReportNum(board2); // 신고 횟수 업데이트 
            			Board2 board = reportService.selectBoardList(board2);

    					result = "Y";
    					boardNo = board2;
    					System.out.println("신고 당한 횟수 : " + board.getBoard_ReportNum());
    					// 4회 이상 신고글 블라인드 상태로 변경
    					if(board.getBoard_ReportNum()>=4) {
    						System.out.println("4회 이상 블라인드 처리");
    						reportService.updateBoardBlind(board);
    					}
    				}
    				
        		}else {
    				boardType = reportService.selectBoardTypeNo(board2); 
    				boardNo = board2;
    				
    				}	
        	}else {
        		
        		// 중복 신고 체크
        		Report reportCheck = new Report(member.getMemNo(),0, board2);	
        		
        		Report rp = reportService.selectCommentReportCheck(reportCheck);
        		System.out.println(" 중복 신고 체크 중 신고내용 :"+ rp);
        		
        		//댓글일때
        		if(rp == null) {
        			
        			//신고가 없을 때
    				Report report = new Report( member.getMemNo(), 0, board2, reason, board2_no);
    				
    				Comments2 comment = reportService.selectComment(board2); // 댓글번호로 댓글정보 가져오기
    				System.out.println("댓글번호로 게시글 번호 가져오기 : " + comment );

    				boardType = reportService.selectBoardTypeNo(comment.getBoard_No()); 

    				int res = reportService.insertReport(report);
    				System.out.println("res :" +res);
    							
    				if(res>0) {
    					System.out.println("여기 들어오면 댓글 신고됨");
    					
    					reportService.updateCommentReportNum(board2); // 신고 횟수 업데이트 
    					result = "Y";
        				boardNo = comment.getBoard_No();
        				comment = reportService.selectComment(board2);
    					System.out.println("신고 당한 횟수 : " + comment.getComm_ReportNum());
    					// 4회 이상 신고글 블라인드 상태로 변경
    					if(comment.getComm_ReportNum()>=4) {
    						System.out.println("4회 이상 블라인드 처리");
    						reportService.updateReportBlind(comment);
    					}

    				} 
    				
        		}else {
    				
    				int bno = reportService.selectBoardNo(board2); // 댓글번호로 게시글번호 가져오기
    				System.out.println("댓글번호로 게시글 번호 가져오기 : " + bno );
    				
    				boardType = reportService.selectBoardTypeNo(bno); 

    				boardNo = bno;
    				}	
        	}
        
			System.out.println("컨트롤러 보드넘버"+boardNo);
			System.out.println("컨트롤러 타입넘버"+boardType);
			if(result == "Y") {

				switch(boardType) {
		         case 1:
		        	 loc = "/notice.bo?board_no="+ boardNo;
		        	 msg = "성공";
		            break;
	
		         case 2:
		        	 loc = "/board2/jobSelectOne.do?board_No="+ boardNo;
		        	 msg = "성공";
		            break;
		               
		         case 4:
		        	 loc = "/board2/blahView.do?board_No="+ boardNo;
		        	 msg = "성공";
		            break;
		         
		         case 5:
		        	 loc = "/board2/blindSelectOne.do?board_No="+ boardNo;
		        	 msg = "성공";
		            break;
	
		         case 6:
		        	 loc = "/selectOneTomorrow.bo?board_no="+ boardNo;
		        	 msg = "성공";
		            break;
	
		         case 7:
		        	loc = "/board2/qnaSelectOne.do?board_No="+ boardNo;
		        	msg = "성공";
		            break;   
	
		         case 8:
		        	 loc = "/selectOneMento.bo?board_no="+ boardNo;
		        	 msg = "성공";
		            break;
		            
		         case 9:
		        	 loc = "/selectOneInterview.bo?board_no="+ boardNo;
		        	 msg = "성공";
		            break;
	
		         case 10:
		        	 loc = "/selectOneAccept.bo?board_no="+ boardNo;
		        	 msg = "성공";
		            break;
		         }
				
			}else {
				
				switch(boardType) {
		         case 1:
		        	 loc = "/notice.bo?board_no="+ boardNo;
		        	 msg = "중복신고는 안되요~ㅠㅠ";
		            break;
	
		         case 2:
		        	 loc = "/board2/jobSelectOne.do?board_No="+ boardNo;
		        	 msg = "중복신고는 안되요~ㅠㅠ";
		            break;
		               
		         case 4:
		        	 loc = "/board2/blahView.do?board_No="+ boardNo;
		        	 msg = "중복신고는 안되요~ㅠㅠ";
		            break;
		         
		         case 5:
		        	 loc = "/board2/blindSelectOne.do?board_No="+ boardNo;
		        	 msg = "중복신고는 안되요~ㅠㅠ";
		            break;
	
		         case 6:
		        	 loc = "/selectOneTomorrow.bo?board_no="+ boardNo;
		        	 msg = "중복신고는 안되요~ㅠㅠ";
		            break;
	
		         case 7:
		        	loc = "/board2/qnaSelectOne.do?board_No="+ boardNo;
		        	 msg = "중복신고는 안되요~ㅠㅠ";
		            break;   
	
		         case 8:
		        	 loc = "/selectOneMento.bo?board_no="+ boardNo;
		        	 msg = "중복신고는 안되요~ㅠㅠ";
		            break;
		            
		         case 9:
		        	 loc = "/selectOneInterview.bo?board_no="+ boardNo;
		        	 msg = "중복신고는 안되요~ㅠㅠ";
		            break;
	
		         case 10:
		        	 loc = "/selectOneAccept.bo?board_no="+ boardNo;
		        	 msg = "중복신고는 안되요~ㅠㅠ";
		            break;
		         }
			}
	         
	         model.addAttribute("msg", msg);
	         model.addAttribute("loc", loc);
	      
	      return "user/common/msg";
		
	}

	// 신고 게시글 상세 페이지 접속
	@RequestMapping("boardReportDetail.do")
	public String boardReportDetail(Model model, int boardNo, String reportReason, String appendantMemNick, String reporterMemNick) {
		
		System.out.println("여기는 컨트롤러 boardNo:"+ boardNo +"reportReason:"+ reportReason+"appendantMemNick:"+appendantMemNick+"reporterMemNick:"+reporterMemNick);
		
		Board2 board2 = reportService.selectBoardList(boardNo);
		System.out.println("board2 : " + board2.toString());
		
		List<Report> DetailList = new ArrayList<Report>();	 		//해당 게시글 첫번째를 제외한 신고정보 
		List<Member> DetailMemberList = new ArrayList<Member>();	//해당 게시글 첫번째를 제외한 신고정보에 대한 신고자 정보
		// 상세 페이지에 board_No로 모든 신고정보 가져오기 
		DetailList = reportService.selectDetailReportList(boardNo);
		
		for(Report report: DetailList) {
			System.out.println("신고자 정보 : "+report.getMemNo());
			Member DetailMember = reportService.selectMember(report.getMemNo());
			System.out.println("신고정보의 신고자 정보 : "+ DetailMember);
			
			DetailMemberList.add(DetailMember);
		}
		

		String boardType = reportService.selectBoardType(board2.getType_No());
		System.out.println("boardType : " + boardType);
		
		//첫 신고 정보
		model.addAttribute("boardList", board2);
		model.addAttribute("reportReason", reportReason);
		model.addAttribute("appendantMemNick", appendantMemNick);
		model.addAttribute("reporterMemNick", reporterMemNick);
		model.addAttribute("boardType", boardType); // 게시판 타입 String으로 변경
		//두 번째 부터의 신고 내용
		
		model.addAttribute("DetailList", DetailList);
		model.addAttribute("DetailMemberList", DetailMemberList);

		return "admin/report/boardReportDetail";
	}
	
	// 신고 댓글 상세 페이지 접속
		@RequestMapping("commentReportDetail.do")
		public String commentReportDetail(Model model, int commentNo, String reportReason, String appendantMemNick, String reporterMemNick) {
			
			System.out.println("여기는 컨트롤러 commentNo:"+ commentNo +"reportReason:"+ reportReason+"appendantMemNick:"+appendantMemNick+"reporterMemNick:"+reporterMemNick);
			
			Comments2 comment = reportService.selectComment(commentNo);
			System.out.println("comment : " + comment.toString());
			
			List<Report> DetailList = new ArrayList<Report>();	 		//해당 댓글 첫번째를 제외한 신고정보 
			List<Member> DetailMemberList = new ArrayList<Member>();	//해당 댓글 첫번째를 제외한 신고정보에 대한 신고자 정보
			// 상세 페이지에 board_No로 모든 신고정보 가져오기 
			String boardType = "";
			
			DetailList = reportService.selectDetailCommentsReportList(commentNo);
			
			
			for(Report report: DetailList) {
				System.out.println("신고자 정보 : "+report.getMemNo());
				Member DetailMember = reportService.selectMember(report.getMemNo());
				System.out.println("신고정보의 신고자 정보 : "+ DetailMember);
				
				DetailMemberList.add(DetailMember);
			}
			//게시글 번호 넘겨서 게시글 타입번호 가져오기
			Board2 board = reportService.selectBoardList(comment.getBoard_No());
			//게시글 타입번호로 게시글 타입 가져오기
			boardType = reportService.selectBoardType(board.getType_No());

			System.out.println("boardType : " + boardType);
			
			//첫 신고 정보
			model.addAttribute("comment", comment);
			model.addAttribute("board", board);			
			model.addAttribute("reportReason", reportReason);
			model.addAttribute("appendantMemNick", appendantMemNick);
			model.addAttribute("reporterMemNick", reporterMemNick);
			model.addAttribute("boardType", boardType); // 게시판 타입 String으로 변경
			//두 번째 부터의 신고 내용
			
			model.addAttribute("DetailList", DetailList);
			model.addAttribute("DetailMemberList", DetailMemberList);

			return "admin/report/commentReportDetail";
		}
		
	//신고 게시글 업데이트
	@RequestMapping("boardReportUpdate.do")
	public String boardReportUpdate(Model model, int boardNo, String boardStatus) {
		
		System.out.println("게시글업데이트 boardNo:"+boardNo);
		System.out.println("게시글업데이트 boardStatus:"+boardStatus);
		
		int res = reportService.updateBoard(boardNo, boardStatus);
		System.out.println("res:"+res);
			
			if( boardStatus.equals("Y")){ // 업데이트 성공시
				reportService.deleteReport(boardNo);
				reportService.updateBoardReportNumReset(boardNo);
				System.out.println("신고횟수 초기화 및 신고 테이블에서 정보 삭제 ok");
				
				return "redirect:boardReportList.do";
			
			}else { // 업데이트 실패시

				return "redirect:boardReportList.do"; 
			
			}
		}
	
	
	// 신고 댓글 업데이트
	@RequestMapping("commentReportUpdate.do")
	public String commentReportUpdate(Model model, int commNo, String commStatus ) {
		
		System.out.println("댓업데이트 commentNo:"+commNo);
		System.out.println("댓글업데이트 commentStatus:"+commStatus);
		
		int res = reportService.updateComment(commNo, commStatus);
		
	
		if( commStatus.equals("Y")){ // 업데이트 성공시
			reportService.deleteCommentReport(commNo);
			reportService.updateCommentReportNumReset(commNo);
			System.out.println("신고횟수 초기화 및 신고 테이블에서 정보 삭제 ok");
			
			return "redirect:commentReportList.do";
			
		}else { // 업데이트 실패시
			
			return "redirect:commentReportList.do"; 
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
			System.out.println("report:"+report.toString());
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
