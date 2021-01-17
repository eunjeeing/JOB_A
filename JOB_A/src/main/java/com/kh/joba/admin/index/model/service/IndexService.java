package com.kh.joba.admin.index.model.service;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.board2.blahblah.model.vo.Board2;


public interface IndexService {
	
	List<Map<String, String>> selectRank();

	List<Map<String, String>> selectBoard();

	List<Map<String, String>> countBoard();

	List<Map<String, String>> countTodayBoard();

	List<Map<String, String>> countTodayMember();

	List<Map<String, String>> countTotalMember();
}
