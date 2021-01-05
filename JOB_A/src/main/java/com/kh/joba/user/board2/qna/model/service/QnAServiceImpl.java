package com.kh.joba.user.board2.qna.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.user.attachment.model.vo.Attachment;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.board2.qna.model.dao.QnADAO;
import com.kh.joba.user.common.exception.BoardException;

@Service
public class QnAServiceImpl implements QnAService {
	
	@Autowired
	QnADAO qd;

	@Override
	public List<Map<String, String>> selectQnAList(int cPage, int numPerPage) {
		return qd.selectQnAList(cPage, numPerPage);
	}

	@Override
	public int selectQnATotalContents() {
		return qd.selectQnATotalContents();
	}

	@Override
	public Board2 qnaSelectOne(int board_No) {
		Board2 board = qd.qnaSelectOne(board_No);
		
		if( board != null ) qd.updateQnAReadCount(board_No);
		
		return board;
	}

	@Override
	public List<Attachment> selectAttachmentList(int board_No) {
		return qd.selectAttachmentList(board_No);
	}

	@Override
	public int deleteQnA(int board_No) {
		return qd.deleteQnA(board_No);
	}

	@Override
	public int insertQnA(Board2 board) {
		int result = 0;
		
		result = qd.insertQnA(board);
		if(result<1) throw new BoardException("게시글 추가 중 에러 발생");
		
		return result;
	}

	@Override
	public int updateQnA(Board2 board) {
		return qd.updateQnA(board);

	}

	@Override
	public List<Map<String, String>> searchQnAList(int cPage, int numPerPage, String keyword) {
		return qd.searchQnAList(cPage, numPerPage, keyword);
	}

	@Override
	public int searchQnATotalContents(String keyword) {
		return qd.searchQnATotalContents(keyword);
	}

}
