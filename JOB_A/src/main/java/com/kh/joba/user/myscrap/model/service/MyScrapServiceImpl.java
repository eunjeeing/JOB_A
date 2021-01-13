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
		return msDAO.selectMyScrapList(cPage,numPerPage, mem_no);
	}

	@Override
	public int selectMyScrapTotalContents(int mem_no) {
		return msDAO.selectMyScrapTotalContents(mem_no);
	}

	@Override
	public List<Map<String, String>> sortMyScrapList(int cPage, int numPerPage, Bookmark book) {
		return msDAO.sortMyScrapList(cPage,numPerPage, book);
	}

	@Override
	public int sortMyScrapTotalContents(Bookmark book) {
		return msDAO.sortMyScrapTotalContents(book);
	}

	@Override
	public List<Map<String, String>> searchScrapList(int cPage, int numPerPage, Bookmark book) {
		return msDAO.searchScrapList(cPage, numPerPage, book);
	}

	@Override
	public int searchMyScrapTotalContents(Bookmark book) {
		return msDAO.searchScrapTotalContents(book);
	}
	
	 

}
