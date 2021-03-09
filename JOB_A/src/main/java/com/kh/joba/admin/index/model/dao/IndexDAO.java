package com.kh.joba.admin.index.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.board2.blahblah.model.vo.Board2;


public interface IndexDAO {
	
	List<Map<String, String>> selectAllCount();

	List<Map<String, String>> carouselList();

	List<Map<String, String>> countBoard();

	List<Map<String, String>> countTodayBoard();

	List<Map<String, String>> countTodayMember();

	List<Map<String, String>> countTotalMember();

	List<Map<String, String>> countReport();

	List<Map<String, String>> recentBoard();
}
