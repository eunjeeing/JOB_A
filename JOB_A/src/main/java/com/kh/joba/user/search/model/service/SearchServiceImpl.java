package com.kh.joba.user.search.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.user.search.model.dao.SearchDAO;
import com.kh.joba.user.search.model.vo.Search;

@Service
public class SearchServiceImpl implements SearchService {

	@Autowired
	SearchDAO searchDAO;
	
	@Override
	public Search selectOne(int board_No) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Map<String, String>> searchList(int cPage, int numPerPage, String keyword) {
		// TODO Auto-generated method stub
		return searchDAO.searchList(cPage,numPerPage,keyword);
	}

	@Override
	public int searchTotalContents(String keyword) {
		// TODO Auto-generated method stub
		return 0;
	}


}
