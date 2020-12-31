package com.kh.joba.user.board2.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.user.board2.model.dao.Board2DAO;
import com.kh.joba.user.board2.model.vo.Attachment2;
import com.kh.joba.user.board2.model.vo.Board2;

@Service
public class Board2ServiceImpl implements Board2Service {
	
	@Autowired
	Board2DAO boardDAO;

	@Override
	public List<Map<String, String>> selectBlahBlahList(int cPage, int numPerPage) {
		return boardDAO.selectBlahBlahList(cPage, numPerPage);
	}

	@Override
	public int selectBlahBlahTotalContents() {
		return boardDAO.selectBlahBlahTotalContents();
	}

	@Override
	public Board2 selectOneBlah(int board_No) {
		
		Board2 board = boardDAO.selectOneBlah(board_No);
		
		if( board != null ) boardDAO.updateBlahReadCount(board_No);
		
		return board;
	}

	@Override
	public List<Attachment2> selectAttachmentList(int board_No) {

		return boardDAO.selectAttachmentList(board_No);	}

	@Override
	public int blahDelete(int board_No) {
		return boardDAO.blahDelete(board_No);
	}
}
