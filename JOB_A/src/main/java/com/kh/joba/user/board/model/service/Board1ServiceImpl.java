package com.kh.joba.user.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.user.board.model.dao.Board1DAO;
import com.kh.joba.user.board.model.vo.Board1;
import com.kh.joba.user.bookmark.model.dao.BookmarkDAO;

@Service
public class Board1ServiceImpl implements Board1Service {
	
	@Autowired
	Board1DAO board1DAO;
	
	@Autowired
	BookmarkDAO bmDAO;

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
	@Override
	public String selectNoticeFromIndex(String keyword) {
		return board1DAO.selectNoticeFromIndex(keyword);
	}
	// *******************************************************************************************
// 							Mentoring Service Area
// *******************************************************************************************
	@Override
	public List<Map<String, String>> selectMentoList(int cPage, int numPerPage) {
		return board1DAO.selectMentoList(cPage, numPerPage);
	}
	@Override
	public int selectMentoTotalContents() {
		return board1DAO.selectMentoTotalContents();
	}
	@Override
	public Board1 selectOneMento(int board_no) {
		Board1 mento = board1DAO.selectOneMento(board_no);
		if (mento != null) board1DAO.updateViewCount(board_no);
		return mento;
	}
	@Override
	public List<Map<String, String>> searchMentoList(int cPage, int numPerPage, String keyword) {
		return board1DAO.searchMentoList(cPage, numPerPage, keyword);
	}
	@Override
	public int searchMentoTotalContents(String keyword) {
		return board1DAO.searchMentoTotalContents(keyword);
	}
	@Override
	public int mentoUpdate(Board1 mento) {
		return board1DAO.updateMento(mento);
	}
	@Override
	public int mentoDelete(int board_no) {
		int result = board1DAO.deleteMetno(board_no);
		if (result > 0) {
			int result2 = bmDAO.deleteAllBookmark(board_no);
		}
		return result;
	}
	@Override
	public int mentoInsert(Board1 mento) {
		return board1DAO.insertMento(mento);
	}


// *******************************************************************************************
// 							UntilTomorrow Service Area
// *******************************************************************************************
	@Override
	public List<Map<String, String>> selectTomorrowList(int cPage, int numPerPage) {
		int result = board1DAO.updateTomorrowOutDate();
		return board1DAO.selectTomorrowList(cPage, numPerPage);
	}
	@Override
	public int selectTomorrowTotalContents() {
		return board1DAO.selectTomorrowTotalContents();
	}
	@Override
	public Board1 selectOneTomorrow(int board_no) {
		Board1 tomorrow = board1DAO.selectOneTomorrow(board_no);
		if (tomorrow != null) board1DAO.updateViewCount(board_no);
		return tomorrow;
	}
	@Override
	public List<Map<String, String>> searchTomorrowList(int cPage, int numPerPage, String keyword) {
		int result = board1DAO.updateTomorrowOutDate();
		return board1DAO.searchTomorrowList(cPage, numPerPage, keyword);
	}
	@Override
	public int searchTomorrowTotalContents(String keyword) {
		return board1DAO.searchTomorrowTotalContents(keyword);
	}
	@Override
	public int tomorrowUpdate(Board1 tomorrow) {
		return board1DAO.updateTomorrow(tomorrow);
	}
	@Override
	public int tomorrowDelete(int board_no) {
		int result = board1DAO.deleteTomorrow(board_no);	
		if (result > 0) {
			int result2 = bmDAO.deleteAllBookmark(board_no);
		}
		return result;
	}
	
	@Override
	public int tomorrowInsert(Board1 tomorrow) {
		return board1DAO.insertTomorrow(tomorrow);
	}
	
	
// *******************************************************************************************
// 							InterviewReview Service Area
// *******************************************************************************************
	@Override
	public List<Map<String, String>> selectInterviewList(int cPage, int numPerPage) {
		int reuslt = bmDAO.deleteAllBookmark();
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
	public int interviewUpdate(Board1 interview) {
		return board1DAO.interviewUpdate(interview);
	}
	@Override
	public int interviewDelete(int board_no) {
		int result = board1DAO.interviewDelete(board_no);
		if (result > 0) {
			int result2 = bmDAO.deleteAllBookmark(board_no);
		}
		return result;
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
		return board1DAO.searchAcceptList(cPage,numPerPage, keyword);
	}
	@Override
	public int searchAcceptTotalContents(String keyword) {
		return board1DAO.searchAcceptTotalContents(keyword);
	}
	@Override
	public Board1 selectOneAccept(int board_no) {
		Board1 accept = board1DAO.selectOneAccept(board_no);
		if( accept != null) board1DAO.updateViewCount(board_no);
		return accept;
	}
	@Override
	public int acceptUpdate(Board1 accept) {
		return board1DAO.acceptUpdate(accept);
	}          
	@Override  
	public int acceptDelete(int board_no) {
		int result = board1DAO.acceptDelete(board_no);
		if (result > 0) {
			int result2 = bmDAO.deleteAllBookmark(board_no);
		}
		return result;
	}         
	@Override  
	public int acceptInsert(Board1 accept) {
		return board1DAO.acceptInsert(accept);
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
