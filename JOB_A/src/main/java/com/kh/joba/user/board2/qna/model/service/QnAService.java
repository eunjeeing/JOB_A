package com.kh.joba.user.board2.qna.model.service;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.attachment.model.vo.Attachment;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;

public interface QnAService {

	List<Map<String, String>> selectQnAList(int cPage, int numPerPage);

	int selectQnATotalContents();

	Board2 qnaSelectOne(int board_No);

	List<Attachment> selectAttachmentList(int board_No);

	int deleteQnA(int board_No);

	int insertQnA(Board2 board);

	int updateQnA(Board2 board);

	List<Map<String, String>> searchQnAList(int cPage, int numPerPage, String keyword);

	int searchQnATotalContents(String keyword);
}
