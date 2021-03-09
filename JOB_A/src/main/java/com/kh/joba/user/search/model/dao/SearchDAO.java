package com.kh.joba.user.search.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.search.model.vo.Search;

public interface SearchDAO {
	
	List<Map<String, String>> searchList(int cPage, int numPerPage, String keyword);

	int searchTotalContents(String keyword);

}
