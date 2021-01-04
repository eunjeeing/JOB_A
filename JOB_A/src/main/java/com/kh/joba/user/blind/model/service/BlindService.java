package com.kh.joba.user.blind.model.service;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.attachment.model.vo.Attachment;
import com.kh.joba.user.blahblah.model.vo.Board2;

public interface BlindService {

	List<Map<String, String>> selectBlindList(int cPage, int numPerPage);

	int selectBlindTotalContents();

	Board2 blindSelectOne(int board_No);

	List<Attachment> selectAttachmentList(int board_No);

	int deleteBlind(int board_No);

	int insertBlind(Board2 board);

	int updateBlind(Board2 board);

	List<Map<String, String>> searchBlindList(int cPage, int numPerPage, String keyword);

	int searchBlindTotalContents(String keyword);

}
