package com.kh.joba.user.board2.model.service;

import java.util.List;
import java.util.Map;

public interface Board2Service {

	List<Map<String, String>> selectBlahBlahList(int cPage, int numPerPage);

	int selectBlahBlahTotalContents();

	
}
