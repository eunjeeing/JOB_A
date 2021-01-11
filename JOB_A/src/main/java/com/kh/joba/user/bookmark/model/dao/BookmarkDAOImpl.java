package com.kh.joba.user.bookmark.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.user.bookmark.model.vo.Bookmark;

@Repository
public class BookmarkDAOImpl implements BookmarkDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertBookmark(Bookmark bookmark) {
		return sqlSession.insert("bookmarkMapper.insertBookmark", bookmark);
	}

	@Override
	public int deleteBookmark(Bookmark bookmark) {
		return sqlSession.delete("bookmarkMapper.deleteBookmark", bookmark);
	}

	@Override
	public List<Bookmark> selectAllBookmark(int mem_no) {
		return sqlSession.selectList("bookmarkMapper.selectBookmarkList", mem_no);
	}

	@Override
	public Bookmark selectOneBookmark(Bookmark bookmark) {
		return sqlSession.selectOne("bookmarkMapper.selectBookmark", bookmark);
	}

	@Override
	public int deleteAllBookmark(int board_no) {
		return sqlSession.delete("bookmarkMapper.deleteAllBookmark", board_no);
	}
	
	
	
	
}
