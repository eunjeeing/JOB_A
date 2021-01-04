package com.kh.joba.user.blind.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.user.attachment.model.vo.Attachment;
import com.kh.joba.user.blahblah.model.vo.Board2;
import com.kh.joba.user.blind.model.dao.BlindDAO;
import com.kh.joba.user.common.exception.BoardException;

@Service
public class BlindServiceImpl implements BlindService {
	
	@Autowired
	BlindDAO blindDAO;

	@Override
	public List<Map<String, String>> selectBlindList(int cPage, int numPerPage) {
		return blindDAO.selectBlindList(cPage, numPerPage);
	}

	@Override
	public int selectBlindTotalContents() {
		return blindDAO.selectBlindTotalContents();
	}

	@Override
	public Board2 blindSelectOne(int board_No) {
		
		Board2 board = blindDAO.blindSelectOne(board_No);
		
		if( board != null ) blindDAO.updateBlindReadCount(board_No);
		
		return board;
	}

	@Override
	public List<Attachment> selectAttachmentList(int board_No) {
		return blindDAO.selectAttachmentList(board_No);
	}

	@Override
	public int deleteBlind(int board_No) {
		return blindDAO.deleteBlind(board_No);
	}

	@Override
	public int insertBlind(Board2 board) {
		int result = 0;
		
		result = blindDAO.insertBlind(board);
		if(result<1) throw new BoardException("게시글 추가 중 에러 발생");
		
		return result;
	}

	@Override
	public int updateBlind(Board2 board) {
		return blindDAO.updateBlind(board);
	}

	@Override
	public List<Map<String, String>> searchBlindList(int cPage, int numPerPage, String keyword) {
		return blindDAO.searchBlindList(cPage, numPerPage, keyword);

	}

	@Override
	public int searchBlindTotalContents(String keyword) {
		return blindDAO.searchBlindTotalContents(keyword);
	}

}
