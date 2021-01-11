package com.kh.joba.admin.report.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.board2.blahblah.model.vo.Board2;

public interface ReportDAO {

	// 게시글 신고 리스트 페이지 접속
	List<Map<String, String>> selectReportList();

	// 게시글 신고
	int insertReport(String reason, int board2, int board2_no, int memNo);


}
