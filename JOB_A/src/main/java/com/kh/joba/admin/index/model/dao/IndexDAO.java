package com.kh.joba.admin.index.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.board2.blahblah.model.vo.Board2;


public interface IndexDAO {
	
	List<Board2> selectAllCount();

	List<Map<String, String>> carouselList();
}
