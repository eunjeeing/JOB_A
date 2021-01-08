package com.kh.joba.user.board.model.service;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.board.model.vo.Attachment1;
import com.kh.joba.user.board.model.vo.Board1;
import com.kh.joba.user.board.model.vo.Comment1;

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
	List<Map<String, String>> selectMentoList(int cPage, int numPerPage);
	
	
	
	
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
	int interviewUpdate(Board1 interview);
	int interviewDelete(int board_no);
	int interviewInsert(Board1 interview);
	
// *******************************************************************************************
// 							Accaptance Review Service Area
// *******************************************************************************************
	List<Map<String, String>> selectAcceptList(int cPage, int numPerPage);
	int selectAcceptTotalContents();
	List<Map<String, String>> searchAcceptList(int cPage, int numPerPage, String keyword);
	int searchAcceptTotalContents(String keyword);
	Board1 selectOneAccept(int board_no);
	int acceptUpdate(Board1 accept);	
	int acceptDelete(int board_no);
	int acceptInsert(Board1 accept);
	
// *******************************************************************************************
//							Comment Service Area
//*******************************************************************************************	
	List<Comment1> selectCommentList(int board_no);
	
}
