package com.kh.joba.admin.report.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.admin.report.model.vo.Report;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.member.model.vo.Member;

@Repository
public class ReportDAOImpl implements ReportDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Report> selectReportList() {

		return sqlSession.selectList("reportMapper.selectReportList");
	}

	@Override
	public int insertReport(String reason, int board2, int board2_no, int memNo) {
		
		Report report = new Report(memNo, board2, reason, board2_no);
		
		System.out.println("임플에서 report" + report);
		return sqlSession.insert("reportMapper.insertReport", report);
	}

	// 게시글 정보 가져오기
	@Override
	public Board2 selectBoardList(int boardNo) {

		return sqlSession.selectOne("reportMapper.selectBoardList", boardNo);
	}

	// 신고자, 피신고자 정보 가져오기
	@Override
	public Member selectMember(int memNo) {
		System.out.println("다오임플"+memNo);
		System.out.println("다오임플"+sqlSession.selectOne("reportMapper.selectMember", memNo));

		return sqlSession.selectOne("reportMapper.selectMember", memNo);
	}

	// 게시판 타입 조회
	@Override
	public String selectBoardType(int type_No) {
		
		return sqlSession.selectOne("reportMapper.selectBoardType", type_No);
	}

	// 게시글 비활성화/상태 여부
	@Override
	public int updateBoard(int boardNo, String boardStatus) {
		
		Board2 board2 = new Board2(boardNo, boardStatus);
		
		return sqlSession.update("reportMapper.updateBoard", board2);
	}



}
