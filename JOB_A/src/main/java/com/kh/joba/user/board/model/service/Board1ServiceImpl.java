package com.kh.joba.user.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.user.board.model.dao.Board1DAO;
import com.kh.joba.user.board.model.vo.Attachment1;
import com.kh.joba.user.board.model.vo.Board1;

@Service
public class Board1ServiceImpl implements Board1Service {
	
	@Autowired
	Board1DAO board1DAO;

// *******************************************************************************************
// 							Notice Service Area
// *******************************************************************************************
	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		return board1DAO.selectNoticeList(cPage, numPerPage);
	}
	@Override
	public int selectNoticeTotalContents() {
		return board1DAO.selectNoticeTotalContents();
	}
	@Override
	public List<Map<String, String>> searchNoticeList(int cPage, int numPerPage, String keyword) {
		return board1DAO.searchNoticeList(cPage, numPerPage, keyword);
	}
	@Override
	public int searchNoticeTotalContents(String keyword) {
		return board1DAO.searchNoticeTotalContents(keyword);
	}
	@Override
	public Board1 selectOneNotice(int board_no) {
		Board1 notice = board1DAO.selectOneNotice(board_no);
		if (notice != null ) board1DAO.updateViewCount(board_no);
		return notice;
	}
	@Override
	public int updateNotice(Board1 notice) {
		return board1DAO.updateNotice(notice);
	}
	@Override
	public Board1 updateViewNotice(int board_no) {
		return board1DAO.updateViewNotice(board_no);
	}
	@Override
	public int deleteNotice(int board_no) {
		return board1DAO.deleteNotice(board_no);
	}
	@Override
	public int insertNotice(Board1 notice) {
		return board1DAO.insertNotice(notice);
	}
	
// *******************************************************************************************
// 							Mentoring Service Area
// *******************************************************************************************




// *******************************************************************************************
// 							UntilTomorrow Service Area
// *******************************************************************************************




// *******************************************************************************************
// 							InterviewReview Service Area
// *******************************************************************************************
	@Override
	public List<Map<String, String>> selectInterviewList(int cPage, int numPerPage) {
		return board1DAO.selectInterviewList(cPage, numPerPage);
	}
	@Override
	public int selectInterviewTotalContents() {
		return board1DAO.selectInterviewTotalContents();
	}
	@Override
	public List<Map<String, String>> searchInterviewList(int cPage, int numPerPage, String keyword) {
		return board1DAO.searchInterviewList(cPage, numPerPage, keyword);
	}
	@Override
	public int searchInterviewTotalContents(String keyword) {
		return board1DAO.searchInterviewTotalContents(keyword);
	}
	@Override
	public Board1 selectOneInterview(int board_no) {
		Board1 interview = board1DAO.selectOneInterview(board_no);
		if( interview != null) board1DAO.updateViewCount(board_no);
		return interview;
	}
	@Override
	public List<Attachment1> selectAttachmentList(int board_no) {
		return board1DAO.selectAttachmentList(board_no);
	}
	@Override
	public int interviewUpdate(Board1 interview) {
		return board1DAO.interviewUpdate(interview);
	}
	@Override
	public int interviewDelete(int board_no) {
		return board1DAO.interviewDelete(board_no);
	}
	@Override
	public int interviewInsert(Board1 interview) {
		return board1DAO.interviewInsert(interview);
	}
	// *******************************************************************************************
// 							AcceptanceReview Service Area
// *******************************************************************************************
	@Override
	public List<Map<String, String>> selectAcceptList(int cPage, int numPerPage) {
		return board1DAO.selectAcceptList(cPage, numPerPage);
	}
	@Override
	public int selectAcceptTotalContents() {
		return board1DAO.selectAcceptTotalContents();
	}
	@Override
	public List<Map<String, String>> searchAcceptList(int cPage, int numPerPage, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int searchAcceptTotalContents(String keyword) {
		return 0;
	}
	
	
	
// *******************************************************************************************
//						Comment Service Area
//*******************************************************************************************	
	@Override
	public List selectCommentList(int board_no) {
		return null;
	}
	/* dead code
	@Override
	public Attachment1 selectAttachment(int board_no) {
		return board1DAO.selectAttachment(board_no);
	}*/
	
	
	

}
