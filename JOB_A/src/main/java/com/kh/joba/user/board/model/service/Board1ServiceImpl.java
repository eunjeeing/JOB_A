package com.kh.joba.user.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.user.board.model.dao.Board1DAO;

@Service
public class Board1ServiceImpl implements Board1Service {
	
	@Autowired
	Board1DAO board1DAO;

	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		return board1DAO.selectBoardList(cPage, numPerPage);
	}

	@Override
	public int selectBoardTotalContents() {
		return board1DAO.selectBoardTotalContents();
	}

}
