package com.kh.joba.user.bookmark.model.dao;

import java.util.List;

import com.kh.joba.user.bookmark.model.vo.Bookmark;

public interface BookmarkDAO {

	int insertBookmark(Bookmark bookmark);

	int deleteBookmark(Bookmark bookmark);

	List<Bookmark> selectAllBookmark(int mem_no);

	Bookmark selectOneBookmark(Bookmark bookmark);

	int deleteAllBookmark(int board_no);

}
