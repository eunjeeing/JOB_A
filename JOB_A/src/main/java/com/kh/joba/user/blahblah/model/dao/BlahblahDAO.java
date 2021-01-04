package com.kh.joba.user.blahblah.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.attachment.model.vo.Attachment;
import com.kh.joba.user.blahblah.model.vo.Board2;

public interface BlahblahDAO {
	
	List<Map<String, String>> selectBlahBlahList(int cPage, int numPerPage);

	int selectBlahBlahTotalContents();
	
	Board2 selectOneBlah(int board_No);

	int updateBlahReadCount(int board_No);

	List<Attachment> selectAttachmentList(int board_No);

	int blahDelete(int board_No);

	int insertBlah(Board2 board);

	int updateBlah(Board2 board);

	List<Map<String, String>> searchBlahList(int cPage, int numPerPage, String keyword);

	int searchBlahTotalContents(String keyword);


}
