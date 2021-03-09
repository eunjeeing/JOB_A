package com.kh.joba.admin.report.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.joba.admin.report.model.vo.Report;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.comments2.model.vo.Comments2;
import com.kh.joba.user.member.model.vo.Member;

public interface ReportDAO {

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

	// 댓글 신고 리스트 접속 + 조회
	List<Report> selectCommentList();

	// 댓글번호로 댓글 정보 가지고 오기
	Comments2 selectComment(int commNo);

	// 게시글 신고 횟수 업데이트
	int updateBoardReportNum(int board2);

	// 댓글 신고 횟수 업데이트
	int updateCommentReportNum(int board2);

	// 게시글 중복 신고 체크
	Report selectReportCheck(Report reportCheck);

	// 댓글 중복 체크
	Report selectCommentReportCheck(Report reportCheck);
	
	// 게시글 번호 조회
	int selectBoardTypeNo(int boardNo);

	// 댓글번호로 게시글번호 가져오기
	int selectBoardNo(int board2);

	// 댓글 비활성화/상태 여부
	int updateComment(int commentNo, String commentStatus);

	// 상세 페이지에 board_No로 모든 신고정보 가져오기 
	List<Report> selectDetailReportList(int boardNo);

	// 4회 이상 신고글 블라인드 상태로 변경
	int updateBoardBlind(Board2 board);

	// 신고테이블에서 삭제 
	int deleteReport(int boardNo);
	
	// 신고횟수 초기화
	int updateBoardReportNumReset(int boardNo);

	// 상세 페이지에 comm_No로 모든 신고정보 가져오기 
	List<Report> selectDetailCommentsReportList(int commentNo);

	int updateReportBlind(Comments2 comment);

	// 댓글 신고테이블에서 삭제 
	int deleteCommentReport(int commNo);
	// 댓글 신고횟수 초기화
	int updateCommentReportNumReset(int commNo);



}
