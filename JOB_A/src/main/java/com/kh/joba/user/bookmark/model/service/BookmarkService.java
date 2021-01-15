package com.kh.joba.user.bookmark.model.service;

import java.util.List;

import com.kh.joba.user.bookmark.model.vo.Bookmark;

public interface BookmarkService {

	int insertBookmark(Bookmark bookmark);

	int deleteBookmark(Bookmark bookmark);
	
	List<Bookmark> selectAllBookmark(int mem_no);
	
	Bookmark selectOneBookmark(Bookmark bookmark);

	int deleteAllBookmark();

	
}
