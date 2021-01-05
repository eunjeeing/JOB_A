package com.kh.joba.user.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.board.model.vo.Board1;

public interface Board1Service {
	
	// *******************************************************************************************
	// 							Notice Service Area
	// *******************************************************************************************
	List<Map<String, String>> selectNoticeList(int cPage, int numPerPage);
	int selectNoticeTotalContents();
	List<Map<String, String>> searchNoticeList(int cPage, int numPerPage, String keyword);
	int searchNoticeTotalContents(String keyword);
	Board1 selectOneNotice(int board_no);
	int updateNotice(Board1 notice);
	Board1 updateViewNotice(int board_no);
	int deleteNotice(int board_no);
	int insertNotice(Board1 notice);
	
	// *******************************************************************************************
	// 							Mentoring Controller Area
	// *******************************************************************************************
	
	
	
	
	// *******************************************************************************************
	// 							UntilTomorrow Controller Area
	// *******************************************************************************************
	
	
	// *******************************************************************************************
	// 							InterviewReview Service Area
	// *******************************************************************************************
	List<Map<String, String>> selectInterviewList(int cPage, int numPerPage);
	int selectInterviewTotalContents();
	
	
	// *******************************************************************************************
	// 							AcceptanceReview Controller Area
	// *******************************************************************************************
	List<Map<String, String>> selectAcceptList(int cPage, int numPerPage);
	int selectAcceptTotalContents();
	
	
	
}
