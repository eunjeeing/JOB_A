package com.kh.joba.user.board2.blahblah.model.service;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.attachment.model.vo.Attachment;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;

public interface BlahblahService {

	List<Map<String, String>> selectBlahBlahList(int cPage, int numPerPage);

	int selectBlahBlahTotalContents();

	Board2 selectOneBlah(int board_No);

	List<Attachment> selectAttachmentList(int board_No);

	int blahDelete(int board_No);

	int insertBlah(Board2 board);

	int updateBlah(Board2 board);

	List<Map<String, String>> searchBlahList(int cPage, int numPerPage, String keyword);

	int searchBlahTotalContents(String keyword);


	
}
