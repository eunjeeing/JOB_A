package com.kh.joba.user.myscrap.model.service;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.bookmark.model.vo.Bookmark;

public interface MyScrapService {

	List<Map<String, String>> selectMyScrapList(int cPage, int numPerPage, int mem_no);

	int selectMyScrapTotalContents(int mem_no);

	List<Map<String, String>> sortMyScrapList(int cPage, int numPerPage, Bookmark book);

	int sortMyScrapTotalContents(int mem_no);
	
	
}
