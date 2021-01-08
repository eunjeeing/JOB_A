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
	
	
	// *******************************************************************************************
	// 							UntilTomorrow DAO Area
	// *******************************************************************************************
	
	
	// *******************************************************************************************
	// 							Interview Review DAO Area
	// *******************************************************************************************
	List<Map<String, String>> selectInterviewList(int cPage, int numPerPage);
	int selectInterviewTotalContents();
	Board1 selectOneInterview(int board_no);
	List<Attachment1> selectAttachmentList(int board_no);
	int interviewUpdate(Board1 interview);
	int interviewDelete(int board_no);
	int interviewInsert(Board1 interview);
	List<Map<String, String>> searchInterviewList(int cPage, int numPerPage, String keyword);
	int searchInterviewTotalContents(String keyword);


	
	// *******************************************************************************************
	// 							Acceptance Review DAO Area
	// *******************************************************************************************
	List<Map<String, String>> selectAcceptList(int cPage, int numPerPage);
	int selectAcceptTotalContents();
	
	

	

}
