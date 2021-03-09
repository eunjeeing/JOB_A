package com.kh.joba.admin.management.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.joba.admin.management.model.vo.Admin;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.member.model.vo.Member;

public interface AdminDAO {

	List<Map<String, String>> selectAdminList();

	int insertAdmin(Admin admin);

	int deleteAdmin(int adminNo);

	Admin selectAdmin(int adminNo);

	int updateAdmin(Admin admin);
	
	
	/*************************************/
	

	List<Map<String, String>> selectMemberList();

	List<Map<String, String>> selectBoardList(int memNo);

	List<Map<String, String>> selectCommentList(int memNo);

	List<Map<String, String>> selectReportBoardList(int memNo);

	List<Map<String, String>> selectReportCommentList(int memNo);

	List<Map<String, String>> selectMember(int memNo);

	Board2 selectBoardDetail(int boardNo);
	
	List<Map<String, String>> selectGradeList();

	int changeGrade(Member member);

	int changeStatus(Member member);

}
