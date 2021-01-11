package com.kh.joba.admin.report.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.admin.report.model.dao.ReportDAO;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	ReportDAO reportDAO;
	
	// 게시글 신고 리스트 페이지 접속
	@Override
	public List<Map<String, String>> selectReportList() {
		
		return reportDAO.selectReportList();
	}

	// 게시글 신고
	@Override
	public int insertReport(String reason, int board2, int board2_no, int memNo) {

		return reportDAO.insertReport(reason, board2, board2_no, memNo);
	}

}
