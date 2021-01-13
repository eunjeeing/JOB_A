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
	@Override
	public int selectNoticeFromIndex(String keyword) {
		return sqlSession.selectOne("board1Mapper.selectNoticeFromIndex", keyword);
	}
	// *******************************************************************************************
// 							Mentoring DAO Area
// *******************************************************************************************
	@Override
	public List<Map<String, String>> selectMentoList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board1Mapper.selectMentoList", null, rows);
	}	
	@Override
	public int selectMentoTotalContents() {
		return sqlSession.selectOne("board1Mapper.selectMentoTotalContents");
	}
	@Override
	public Board1 selectOneMento(int board_no) {
		return sqlSession.selectOne("board1Mapper.selectOneMento", board_no);
	}
	@Override
	public List<Map<String, String>> searchMentoList(int cPage, int numPerPage, String keyword) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board1Mapper.searchMentoList", keyword, rows);
	}
	@Override
	public int searchMentoTotalContents(String keyword) {
		return sqlSession.selectOne("board1Mapper.searchMentoTotalContents", keyword);
	}
	@Override
	public int updateMento(Board1 mento) {
		return sqlSession.update("board1Mapper.updateMento", mento);
	}
	@Override
	public int deleteMetno(int board_no) {
		return sqlSession.update("board1Mapper.deleteMento", board_no);
	}
	@Override
	public int insertMento(Board1 mento) {
		return sqlSession.insert("board1Mapper.insertMento", mento);
	}
	
	

// *******************************************************************************************
// 							UntilTomorrow DAO Area
// *******************************************************************************************
	@Override
	public List<Map<String, String>> selectTomorrowList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board1Mapper.selectTomorrowList", null, rows);
	}	
	@Override
	public int selectTomorrowTotalContents() {
		return sqlSession.selectOne("board1Mapper.selectTomorrowTotalContents");
	}
	@Override
	public Board1 selectOneTomorrow(int board_no) {
		return sqlSession.selectOne("board1Mapper.selectOneTomorrow", board_no);
	}
	@Override
	public List<Map<String, String>> searchTomorrowList(int cPage, int numPerPage, String keyword) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board1Mapper.searchTomorrowList", keyword, rows);
	}
	@Override
	public int searchTomorrowTotalContents(String keyword) {
		return sqlSession.selectOne("board1Mapper.searchTomorrowTotalContents", keyword);
	}
	@Override
	public int updateTomorrow(Board1 tomorrow) {
		return sqlSession.update("board1Mapper.updateTomorrow", tomorrow);
	}
	@Override
	public int deleteTomorrow(int board_no) {
		return sqlSession.update("board1Mapper.deleteTomorrow", board_no);
	}
	@Override
	public int insertTomorrow(Board1 tomorrow) {
		return sqlSession.insert("board1Mapper.insertTomorrow", tomorrow);
	}
	
	
	
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
	@Override
	public List<Map<String, String>> searchAcceptList(int cPage, int numPerPage, String keyword) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board1Mapper.searchAcceptList", keyword, rows);
	}
	@Override
	public int searchAcceptTotalContents(String keyword) {
		return sqlSession.selectOne("board1Mapper.searchAcceptTotatlContents");
	}
	@Override
	public Board1 selectOneAccept(int board_no) {
		return sqlSession.selectOne("board1Mapper.selectOneAccept", board_no);
	}
	@Override
	public int acceptUpdate(Board1 accept) {
		return sqlSession.update("board1Mapper.acceptUpdate", accept);
	}
	@Override
	public int acceptDelete(int board_no) {
		return sqlSession.update("board1Mapper.acceptDelete", board_no);
	}
	@Override
	public int acceptInsert(Board1 accept) {
		return sqlSession.insert("board1Mapper.acceptInsert", accept);
	}
	

}
