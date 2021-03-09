package com.kh.joba.user.myscrap.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.user.bookmark.model.vo.Bookmark;

@Repository
public class MyScrapDAOImpl implements MyScrapDAO{
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectMyScrapList(int cPage, int numPerPage, int mem_no) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board1Mapper.selectMyScrapList", mem_no, rows);
	}

	@Override
	public int selectMyScrapTotalContents(int mem_no) {
		return sqlSession.selectOne("board1Mapper.selectMyScrapTotalContents", mem_no);
	}

	@Override
	public List<Map<String, String>> sortMyScrapList(int cPage, int numPerPage, Bookmark book) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board1Mapper.sortMyScrapList", book, rows);
	}

	@Override
	public int sortMyScrapTotalContents(Bookmark book) {
		return sqlSession.selectOne("board1Mapper.sortMyScrapTotalContents", book);
	}

	@Override
	public List<Map<String, String>> searchScrapList(int cPage, int numPerPage, Bookmark book) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board1Mapper.searchScrapList", book, rows);
	}

	@Override
	public int searchScrapTotalContents(Bookmark book) {
		return sqlSession.selectOne("board1Mapper.searchScrapTotalContents", book);
	}
	
	

}
