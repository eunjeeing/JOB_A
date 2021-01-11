package com.kh.joba.user.board2.blahblah.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.user.attachment.model.vo.Attachment;
import com.kh.joba.user.board2.blahblah.model.dao.BlahblahDAO;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.bookmark.model.dao.BookmarkDAO;
import com.kh.joba.user.common.exception.BoardException;


@Service
public class BlahblahServiceImpl implements BlahblahService {
	
	@Autowired
	BlahblahDAO blahblahDAO;
	
	@Autowired
	BookmarkDAO bmDAO;

	@Override
	public List<Map<String, String>> selectBlahBlahList(int cPage, int numPerPage) {
		return blahblahDAO.selectBlahBlahList(cPage, numPerPage);
	}

	@Override
	public int selectBlahBlahTotalContents() {
		return blahblahDAO.selectBlahBlahTotalContents();
	}

	@Override
	public Board2 selectOneBlah(int board_No) {
		
		Board2 board = blahblahDAO.selectOneBlah(board_No);
		
		if( board != null ) blahblahDAO.updateBlahReadCount(board_No);
		
		return board;
	}

	@Override
	public List<Attachment> selectAttachmentList(int board_No) {

		return blahblahDAO.selectAttachmentList(board_No);	}

	@Override
	public int blahDelete(int board_No) {
		int result = blahblahDAO.blahDelete(board_No);
		if (result > 0) {
			int result2 = bmDAO.deleteAllBookmark(board_No);
		}
		return result;
	}

	@Override
	public int insertBlah(Board2 board) {
		int result = 0;
		
		result = blahblahDAO.insertBlah(board);
		if(result<1) throw new BoardException("게시글 추가 중 에러 발생");
		
		return result;
	}

	@Override
	public int updateBlah(Board2 board) {
		return blahblahDAO.updateBlah(board);
	}

	@Override
	public List<Map<String, String>> searchBlahList(int cPage, int numPerPage, String keyword) {
		return blahblahDAO.searchBlahList(cPage, numPerPage, keyword);
	}

	@Override
	public int searchBlahTotalContents(String keyword) {
		return blahblahDAO.searchBlahTotalContents(keyword);
	}


}
