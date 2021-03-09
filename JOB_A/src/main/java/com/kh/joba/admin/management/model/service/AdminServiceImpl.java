package com.kh.joba.admin.management.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.admin.management.model.dao.AdminDAO;
import com.kh.joba.admin.management.model.vo.Admin;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDAO;
	
	@Override
	public List<Map<String, String>> selectAdminList() {
		// TODO Auto-generated method stub
		return adminDAO.selectAdminList();
	}

	@Override
	public int insertAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return adminDAO.insertAdmin(admin);
	}

	@Override
	public int deleteAdmin(int adminNo) {
		// TODO Auto-generated method stub
		return adminDAO.deleteAdmin(adminNo);
	}

	@Override
	public Admin selectAdmin(int adminNo) {
		// TODO Auto-generated method stub
		return adminDAO.selectAdmin(adminNo);
	}
	
	@Override
	public int updateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return adminDAO.updateAdmin(admin);
	}
	
	
	
	/******************************************************************/


	@Override
	public List<Map<String, String>> selectMemberList() {
		// TODO Auto-generated method stub
		return adminDAO.selectMemberList();
	}

	@Override
	public List<Map<String, String>> selectBoardList(int memNo) {
		// TODO Auto-generated method stub
		return adminDAO.selectBoardList(memNo);
	}

	@Override
	public List<Map<String, String>> selectCommentList(int memNo) {
		// TODO Auto-generated method stub
		return adminDAO.selectCommentList(memNo);
	}

	@Override
	public List<Map<String, String>> selectReportBoardList(int memNo) {
		// TODO Auto-generated method stub
		return adminDAO.selectReportBoardList(memNo);
	}

	@Override
	public List<Map<String, String>> selectReportCommentList(int memNo) {
		// TODO Auto-generated method stub
		return adminDAO.selectReportCommentList(memNo);
	}

	@Override
	public List<Map<String, String>> selectMember(int memNo) {
		// TODO Auto-generated method stub
		return adminDAO.selectMember(memNo);
	}

	@Override
	public Board2 selectBoardDetail(int boardNo) {
		// TODO Auto-generated method stub
		return adminDAO.selectBoardDetail(boardNo);
	}
	
	@Override
	public List<Map<String, String>> selectGradeList() {
		// TODO Auto-generated method stub
		return adminDAO.selectGradeList();
	}

	@Override
	public int changeGrade(Member member) {
		// TODO Auto-generated method stub
		return adminDAO.changeGrade(member);
	}

	@Override
	public int changeStatus(Member member) {
		// TODO Auto-generated method stub
		return adminDAO.changeStatus(member);
	}





}
