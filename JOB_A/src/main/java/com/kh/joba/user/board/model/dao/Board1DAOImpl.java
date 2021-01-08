package com.kh.joba.user.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.user.board.model.vo.Attachment1;
import com.kh.joba.user.board.model.vo.Board1;

@Repository
public class Board1DAOImpl implements Board1DAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
// *******************************************************************************************
// 							Notice DAO Area
// *******************************************************************************************
	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board1Mapper.selectNoticeList", null, rows);
	}
	@Override
	public int selectNoticeTotalContents() {
		return sqlSession.selectOne("board1Mapper.selectNoticeTotalContents");
	}
	@Override
	public List<Map<String, String>> searchNoticeList(int cPage, int numPerPage, String keyword) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board1Mapper.searchNoticeList", keyword, rows);
	}
	@Override
	public int searchNoticeTotalContents(String keyword) {
		return sqlSession.selectOne("board1Mapper.searchNoticeTotalContents", keyword);
	}
	@Override
	public Board1 selectOneNotice(int board_no) {
		return sqlSession.selectOne("board1Mapper.selectOneNotice", board_no);
	}
	@Override
	public int updateViewCount(int board_no) {	
		return sqlSession.update("board1Mapper.updateViewCount", board_no);
	}
	@Override
	public Board1 updateViewNotice(int board_no) {
		return sqlSession.selectOne("board1Mapper.selectOneNotice", board_no);
	}
	@Override
	public int updateNotice(Board1 notice) {
		return sqlSession.update("board1Mapper.updateNotice", notice);
	}
	@Override
	public int deleteNotice(int board_no) {
		return sqlSession.update("board1Mapper.deleteNotice", board_no);
	}
	@Override
	public int insertNotice(Board1 notice) {
		return sqlSession.insert("board1Mapper.insertNotice", notice);
	}
	
	
// *******************************************************************************************
// 							Mentoring DAO Area
// *******************************************************************************************




// *******************************************************************************************
// 							UntilTomorrow DAO Area
// *******************************************************************************************




// *******************************************************************************************
// 								Interview DAO Area
// *******************************************************************************************
	@Override
	public List<Map<String, String>> selectInterviewList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board1Mapper.selectInterviewList",null, rows);
	}
	@Override
	public int selectInterviewTotalContents() {
		return sqlSession.selectOne("board1Mapper.selectInterviewTotalContents");
	}
	@Override
	public Board1 selectOneInterview(int board_no) {
		return sqlSession.selectOne("board1Mapper.selectOneInterview", board_no);
	}
	@Override
	public List<Attachment1> selectAttachmentList(int board_no) {
		return sqlSession.selectList("board1Mapper.selectAttachmentList", board_no);
	}
	@Override
	public int interviewUpdate(Board1 interview) {
		return sqlSession.update("board1Mapper.interviewUpdate", interview);
	}
	@Override
	public int interviewDelete(int board_no) {
		return sqlSession.update("board1Mapper.interviewDelete", board_no);
	}
	@Override
	public int interviewInsert(Board1 interview) {
		return sqlSession.insert("board1Mapper.interviewInsert", interview);
	}
	@Override
	public List<Map<String, String>> searchInterviewList(int cPage, int numPerPage, String keyword) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board1Mapper.searchInterviewList", keyword, rows);
	}
	@Override
	public int searchInterviewTotalContents(String keyword) {
		return sqlSession.selectOne("board1Mapper.searchInterviewTotalContents" , keyword);
	}

	// *******************************************************************************************
//								Acceptance DAO Area
//*******************************************************************************************
	@Override
	public List<Map<String, String>> selectAcceptList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board1Mapper.selectAcceptList", null, rows);
	}
	@Override
	public int selectAcceptTotalContents() {
		return sqlSession.selectOne("board1Mapper.selectAcceptTotalContents");
	}

}
