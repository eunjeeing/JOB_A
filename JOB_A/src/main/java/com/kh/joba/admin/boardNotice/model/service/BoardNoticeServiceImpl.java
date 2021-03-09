package com.kh.joba.admin.boardNotice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.admin.boardNotice.model.dao.BoardNoticeDAO;
import com.kh.joba.user.board.model.vo.Board1;

@Service
public class BoardNoticeServiceImpl implements BoardNoticeService{
	
	@Autowired
	BoardNoticeDAO bnDAO;

	@Override
	public List<Map<String, String>> noticeList() {
		return bnDAO.noticeList();
	}

	@Override
	public List<Map<String, String>> adminNoticeList() {
		return bnDAO.adminNoticeList();
	}

	@Override
	public Board1 selectOneNotice(int board_no) {
		return bnDAO.selectOneNotice(board_no);
	}

	@Override
	public int updateNotice(Board1 notice) {
		return bnDAO.updateNotice(notice);
	}

	@Override
	public int deleteNotice(int board_no) {
		return bnDAO.deleteNotice(board_no);
	}

	@Override
	public int insertNotice(Board1 notice) {
		System.out.println("admin service Impl 까지 도착");
		return bnDAO.insertNotice(notice);
	}

	@Override
	public int insertAdminNotice(Board1 notice) {
		System.out.println("admin service Impl 까지 도착");
		return bnDAO.insertAdminNotice(notice);
	}

	@Override
	public Board1 selectOneAdminNotice(int board_no) {
		return bnDAO.selectOneAdminNotice(board_no);
	}

	
	
	@Override
	public List<Map<String, String>> mentoTotalList() {
		return bnDAO.selectMentoTotalList();
	}

	@Override
	public List<Map<String, String>> mentoAnsweredList() {
		return bnDAO.selectMentoAnsweredList();
	}

	@Override
	public List<Map<String, String>> mentoUnansweredList() {
		return bnDAO.selectMentoUnansweredList();
	}

	@Override
	public Board1 selectOneMento(int board_no) {
		return bnDAO.selectOneMento(board_no);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
