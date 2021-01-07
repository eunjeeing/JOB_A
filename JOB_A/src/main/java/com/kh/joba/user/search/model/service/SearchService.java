package com.kh.joba.user.search.model.service;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.search.model.vo.Search;

public interface SearchService {
	
	
	List<Map<String,String>> searchList(int cPage, int numPerPage, String keyword);
	
	int searchTotalContents(String keyword);
	
	
}
