package com.kh.joba.user.board2.model.service;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.board2.model.vo.Attachment2;
import com.kh.joba.user.board2.model.vo.Board2;

public interface Board2Service {

	List<Map<String, String>> selectBlahBlahList(int cPage, int numPerPage);

	int selectBlahBlahTotalContents();

	Board2 selectOneBlah(int board_No);

	List<Attachment2> selectAttachmentList(int board_No);

	
}
