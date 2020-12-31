package com.kh.joba.user.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.user.board.model.dao.Board1DAO;
import com.kh.joba.user.board.model.vo.Board1;

@Service
public class Board1ServiceImpl implements Board1Service {
	
	@Autowired
	Board1DAO board1DAO;

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
		return board1DAO.selectOneNotice(board_no);
	}
	
	
	
	

}
