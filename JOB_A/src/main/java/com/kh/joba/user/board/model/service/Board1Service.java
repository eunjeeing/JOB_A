package com.kh.joba.user.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.board.model.vo.Attachment1;
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
// 							Mentoring Service Area
// *******************************************************************************************
	
	
	
	
// *******************************************************************************************
// 							UntilTomorrow Service Area
// *******************************************************************************************
	
	
// *******************************************************************************************
// 							Interview Review Service Area
// *******************************************************************************************
	List<Map<String, String>> selectInterviewList(int cPage, int numPerPage);
	int selectInterviewTotalContents();
	List<Map<String, String>> searchInterviewList(int cPage, int numPerPage, String keyword);
	int searchInterviewTotalContents(String keyword);
	Board1 selectOneInterview(int board_no);
	List<Attachment1> selectAttachmentList(int board_no);
	
// *******************************************************************************************
// 							Accaptance Review Service Area
// *******************************************************************************************
	List<Map<String, String>> selectAcceptList(int cPage, int numPerPage);
	int selectAcceptTotalContents();
	List<Map<String, String>> searchAcceptList(int cPage, int numPerPage, String keyword);
	int searchAcceptTotalContents(String keyword);
	
// *******************************************************************************************
//							Comment Service Area
//*******************************************************************************************	
	List selectCommentList(int board_no);
	
	
}
