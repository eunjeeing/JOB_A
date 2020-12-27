package com.kh.joba.user.board.model.service;

import java.util.List;
import java.util.Map;

public interface Board1Service {
	
	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();
}
