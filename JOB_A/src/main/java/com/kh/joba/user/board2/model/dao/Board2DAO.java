package com.kh.joba.user.board2.model.dao;

import java.util.List;
import java.util.Map;

public interface Board2DAO {
	
	List<Map<String, String>> selectBlahBlahList(int cPage, int numPerPage);

	int selectBlahBlahTotalContents();

}
