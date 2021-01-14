package com.kh.joba.admin.report.model.service;

import java.util.List;
import java.util.Map;

import com.kh.joba.admin.report.model.vo.Report;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.comments2.model.vo.Comments2;
import com.kh.joba.user.member.model.vo.Member;

public interface ReportService {

	// 게시글 신고 리스트 페이지 접속
	List<Report> selectReportList();

	// 게시글 신고
	int insertReport(Report report);

	// 게시글 정보 가지고 오기
	Board2 selectBoardList(int boardNo);

	// 신고자, 피신고자 정보 가지고 오기
	Member selectMember(int memNo);

	// 게시판 타입 조회
	String selectBoardType(int type_No);

	// 게시글 비활성화/상태 여부 
	int updateBoard(int boardNo, String boardStatus);

	// 댓글 신고 리스트 조회
	List<Report> selectCommentList();

	// 댓글번호로 댓글 정보 가지고 오기
	Comments2 selectComment(int commNo);

	// 게시글 신고 횟수 업데이트
	void updateBoardReportNum(int board2);

	// 댓글 신고 횟수 업데이트
	void updateCommentReportNum(int board2);

	// 중복 신고 체크
	Report selectReportCheck(Report reportCheck);
	
	
}
