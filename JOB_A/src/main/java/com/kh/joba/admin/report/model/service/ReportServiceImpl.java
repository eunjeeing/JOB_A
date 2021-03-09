package com.kh.joba.admin.report.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.admin.report.model.dao.ReportDAO;
import com.kh.joba.admin.report.model.vo.Report;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.comments2.model.vo.Comments2;
import com.kh.joba.user.member.model.vo.Member;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	ReportDAO reportDAO;
	
	// 게시글 신고 리스트 페이지 접속 + 조회
	@Override
	public List<Report> selectReportList() {
		
		return reportDAO.selectReportList();
	}

	// 게시글 신고
	@Override
	public int insertReport(Report report) {

		return reportDAO.insertReport(report);
	}

	// 게시글 정보 가지고 오기
	@Override
	public Board2 selectBoardList(int boardNo) {

		return reportDAO.selectBoardList(boardNo);
	}

	// 신고자, 피신고자 정보 가지고 오기
	@Override
	public Member selectMember(int memNo) {
		System.out.println("비즈임플"+memNo);
		return reportDAO.selectMember(memNo);
	}

	// 게시판 타입 조회
	@Override
	public String selectBoardType(int type_No) {
		
		return reportDAO.selectBoardType(type_No);
	}

	// 게시글 비활성화/상태 여부
	@Override
	public int updateBoard(int boardNo, String boardStatus) {
		
		return reportDAO.updateBoard(boardNo, boardStatus);
	}

	// 댓글 신고 리스트 접속 + 조회
	@Override
	public List<Report> selectCommentList() {
		
		return reportDAO.selectCommentList();
	}

	// 댓글번호로 댓글 정보 가지고 오기
	@Override
	public Comments2 selectComment(int commNo) {
		
		return reportDAO.selectComment(commNo);
	}

	// 신고 횟수 업데이트
	@Override
	public void updateBoardReportNum(int board2) {

	
		int res = reportDAO.updateBoardReportNum(board2);
		
		System.out.println("게시글 신고 횟수 업데이트 되면 1이 들어와야 함: " +res);
	}

	// 댓글 신고 횟수 업데이트
	@Override
	public void updateCommentReportNum(int board2) {
	
		int res = reportDAO.updateCommentReportNum(board2);
		
		System.out.println("댓글 신고 횟수 업데이트 되면 1이 들어와야 함: " +res);
	}

	// 게시글 중복 신고 체크
	@Override
	public Report selectReportCheck(Report reportCheck) {
		
		return reportDAO.selectReportCheck(reportCheck);
	}
	
	// 댓글 중복 신고 체크
	@Override
	public Report selectCommentReportCheck(Report reportCheck) {
		
		return reportDAO.selectCommentReportCheck(reportCheck);
	}

	// 게시글 번호로 게시글 타입번호 가져오기
	@Override
	public int selectBoardTypeNo(int boardNo) {
		
		return reportDAO.selectBoardTypeNo(boardNo);
	}
	
	// 댓글번호로 게시글번호 가져오기
	@Override
	public int selectBoardNo(int board2) {
		
		return reportDAO.selectBoardNo(board2);
	}

	// 댓글 비활성화/상태 여부  
	@Override
	public int updateComment(int commentNo, String commentStatus) {
		
		return reportDAO.updateComment(commentNo, commentStatus);
	}

	// 상세 페이지에 board_No로 모든 신고정보 가져오기 
	@Override
	public List<Report> selectDetailReportList(int boardNo) {
		
		return reportDAO.selectDetailReportList(boardNo);
	}

	// 4회 이상 신고글 블라인드 상태로 변경
	@Override
	public void updateBoardBlind(Board2 board) {
		
		int res =  reportDAO.updateBoardBlind(board);
		
		System.out.println("res"+res);
	}

	// 신고테이블에서 삭제 
	@Override
	public void deleteReport(int boardNo) {
		
		int res = reportDAO.deleteReport(boardNo);
		
		System.out.println("1이상이면 삭제 완료" + res);
	}

	// 신고횟수 초기화
	@Override
	public void updateBoardReportNumReset(int boardNo) {
		
		int res = reportDAO.updateBoardReportNumReset(boardNo);
		
		System.out.println("1이상이면 초기화 완료 " + res);
	}

	// 상세 페이지에 comm_No로 모든 신고정보 가져오기 
	@Override
	public List<Report> selectDetailCommentsReportList(int commentNo) {
		
		return reportDAO.selectDetailCommentsReportList(commentNo);
	}

	// 4회 이상 신고댓글 블라인드 상태로 변경
	@Override
	public void updateReportBlind(Comments2 comment) {
		
		int res =  reportDAO.updateReportBlind(comment);
		
		System.out.println("res"+res);
	}
	
	// 댓글 신고테이블에서 삭제 
	@Override
	public void deleteCommentReport(int commNo) {
		
		int res = reportDAO.deleteCommentReport(commNo);
		
		System.out.println("1이상이면 삭제 완료" + res);
		
	}
	
	// 댓글 신고횟수 초기화
	@Override
	public void updateCommentReportNumReset(int commNo) {
		
		int res = reportDAO.updateCommentReportNumReset(commNo);
		
		System.out.println("1이상이면 초기화 완료 " + res);
		
	}

}
