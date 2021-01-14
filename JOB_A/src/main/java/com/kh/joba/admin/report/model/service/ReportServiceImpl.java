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

	// 중복 신고 체크
	@Override
	public Report selectReportCheck(Report reportCheck) {
		
		return reportDAO.selectReportCheck(reportCheck);
	}

}
