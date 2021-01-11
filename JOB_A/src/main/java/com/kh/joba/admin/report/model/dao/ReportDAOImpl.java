package com.kh.joba.admin.report.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.admin.report.model.vo.Report;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;

@Repository
public class ReportDAOImpl implements ReportDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectReportList() {

		return sqlSession.selectList("reportMapper.selectReportList");
	}

	@Override
	public int insertReport(String reason, int board2, int board2_no, int memNo) {
		
		Report report = new Report(memNo, board2, reason, board2_no);
		
		System.out.println("임플에서 report" + report);
		
		return sqlSession.insert("reportMapper.insertReport", report);
	}



}
