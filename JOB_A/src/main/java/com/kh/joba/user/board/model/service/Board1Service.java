package com.kh.joba.user.board.model.service;

import java.util.List;
import java.util.Map;

public interface Board1Service {
	
	List<Map<String, String>> selectNoticeList(int cPage, int numPerPage);

	int selectNoticeTotalContents();

	List<Map<String, String>> searchNoticeList(int cPage, int numPerPage, String keyword);

	int searchNoticeTotalContents(String keyword);
}
