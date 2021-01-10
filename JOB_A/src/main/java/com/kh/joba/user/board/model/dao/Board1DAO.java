package com.kh.joba.user.board.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.board.model.vo.Attachment1;
import com.kh.joba.user.board.model.vo.Board1;

public interface Board1DAO {

	// *******************************************************************************************
	// 							Notice DAO Area
	// *******************************************************************************************
	List<Map<String, String>> selectNoticeList(int cPage, int numPerPage);
	int selectNoticeTotalContents();
	List<Map<String, String>> searchNoticeList(int cPage, int numPerPage, String keyword);
	int searchNoticeTotalContents(String keyword);
	Board1 selectOneNotice(int board_no);
	int updateViewCount(int board_no);
	int updateNotice(Board1 notice);
	Board1 updateViewNotice(int board_no);
	int deleteNotice(int board_no);
	int insertNotice(Board1 notice);
	
	// *******************************************************************************************
	// 							Mentoring DAO Area
	// *******************************************************************************************
	List<Map<String, String>> selectMentoList(int cPage, int numPerPage);
	int selectMentoTotalContents();
	Board1 selectOneMento(int board_no);
	List<Map<String, String>> searchMentoList(int cPage, int numPerPage, String keyword);
	int searchMentoTotalContents(String keyword);
	int updateMento(Board1 mento);
	int deleteMetno(int board_no);
	int insertMento(Board1 mento);
	
	
	// *******************************************************************************************
	// 							UntilTomorrow DAO Area
	// *******************************************************************************************
	List<Map<String, String>> selectTomorrowList(int cPage, int numPerPage);
	int selectTomorrowTotalContents();
	Board1 selectOneTomorrow(int board_no);
	List<Map<String, String>> searchTomorrowList(int cPage, int numPerPage, String keyword);
	int searchTomorrowTotalContents(String keyword);
	int updateTomorrow(Board1 tomorrow);
	int deleteTomorrow(int board_no);
	int insertTomorrow(Board1 tomorrow);
	
	
	// *******************************************************************************************
	// 							Interview Review DAO Area
	// *******************************************************************************************
	List<Map<String, String>> selectInterviewList(int cPage, int numPerPage);
	int selectInterviewTotalContents();
	List<Map<String, String>> searchInterviewList(int cPage, int numPerPage, String keyword);
	int searchInterviewTotalContents(String keyword);
	Board1 selectOneInterview(int board_no);
	int interviewUpdate(Board1 interview);
	int interviewDelete(int board_no);
	int interviewInsert(Board1 interview);
	List<Attachment1> selectAttachmentList(int board_no);


	
	// *******************************************************************************************
	// 							Acceptance Review DAO Area
	// *******************************************************************************************
	List<Map<String, String>> selectAcceptList(int cPage, int numPerPage);
	int selectAcceptTotalContents();
	List<Map<String, String>> searchAcceptList(int cPage, int numPerPage, String keyword);
	int searchAcceptTotalContents(String keyword);
	Board1 selectOneAccept(int board_no);
	int acceptUpdate(Board1 accept);
	int acceptDelete(int board_no);
	int acceptInsert(Board1 accept);
	
	

	

}
