package com.kh.joba.user.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.user.board.model.vo.Board1;

@Repository
public class Board1DAOImpl implements Board1DAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectNoticeList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board1Mapper.selectNoticeList", null, rows);
	}

	@Override
	public int selectNoticeTotalContents() {
		return sqlSession.selectOne("board1Mapper.selectNoticeTotalContents");
	}

	@Override
	public List<Map<String, String>> searchNoticeList(int cPage, int numPerPage, String keyword) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board1Mapper.searchNoticeList", keyword, rows);
	}

	@Override
	public int searchNoticeTotalContents(String keyword) {
		return sqlSession.selectOne("board1Mapper.searchNoticeTotalContents", keyword);
	}

	@Override
	public Board1 selectOneNotice(int board_no) {
		return sqlSession.selectOne("board1Mapper.selectOneNotice", board_no);
	}
	
	@Override
	public int updateViewCount(int board_no) {	
		return sqlSession.update("board1Mapper.updateViewCount", board_no);
	}

	@Override
	public Board1 updateViewNotice(int board_no) {
		return sqlSession.selectOne("board1Mapper.selectOneNotice", board_no);
	}

	@Override
	public int updateNotice(Board1 notice) {
		return sqlSession.update("board1Mapper.updateNotice", notice);
	}

	@Override
	public int deleteNotice(int board_no) {
		return sqlSession.update("board1Mapper.deleteNotice", board_no);
	}

	@Override
	public int insertNotice(Board1 notice) {
		return sqlSession.insert("board1Mapper.insertNotice", notice);
	}
	
	
	
	
	
	
	
	

}
