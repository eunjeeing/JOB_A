package com.kh.joba.user.bookmark.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.user.bookmark.model.dao.BookmarkDAO;
import com.kh.joba.user.bookmark.model.vo.Bookmark;

@Service
public class BookmarkServiceImpl implements BookmarkService {
	
	@Autowired
	BookmarkDAO bmDAO;

	@Override
	public int insertBookmark(Bookmark bookmark) {
		return bmDAO.insertBookmark(bookmark);
		
	}

	@Override
	public int deleteBookmark(Bookmark bookmark) {
		return bmDAO.deleteBookmark(bookmark);
	}

	@Override
	public List<Bookmark> selectAllBookmark(int mem_no) {
		return bmDAO.selectAllBookmark(mem_no);
	}

	@Override
	public Bookmark selectOneBookmark(Bookmark bookmark) {
		return bmDAO.selectOneBookmark(bookmark);
	}
	
	
	

}
