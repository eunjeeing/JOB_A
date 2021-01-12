package com.kh.joba.user.myscrap.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.user.bookmark.model.vo.Bookmark;
import com.kh.joba.user.myscrap.model.dao.MyScrapDAO;

@Service
public class MyScrapServiceImpl implements MyScrapService {
	
	@Autowired
	MyScrapDAO msDAO;

	@Override
	public List<Map<String, String>> selectMyScrapList(int cPage, int numPerPage, int mem_no) {
		return null;
	}

	@Override
	public int selectMyScrapTotalContents(int mem_no) {
		return 0;
	}

	@Override
	public List<Map<String, String>> sortMyScrapList(int cPage, int numPerPage, Bookmark book) {
		return null;
	}

	@Override
	public int sortMyScrapTotalContents(int mem_no) {
		return 0;
	}

}
