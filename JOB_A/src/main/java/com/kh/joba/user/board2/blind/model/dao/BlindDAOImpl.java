package com.kh.joba.user.board2.blind.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.user.attachment.model.vo.Attachment;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;

@Repository
public class BlindDAOImpl implements BlindDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectBlindList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board2Mapper.selectBlindList", null, rows);
	}

	@Override
	public int selectBlindTotalContents() {
		return sqlSession.selectOne("board2Mapper.selectBlindTotalContents");

	}

	@Override
	public Board2 blindSelectOne(int board_No) {
		return sqlSession.selectOne("board2Mapper.selectOneBoard", board_No);
	}

	@Override
	public List<Attachment> selectAttachmentList(int board_No) {
		return sqlSession.selectList("board2Mapper.selectAttachmentList", board_No);
	}

	@Override
	public int updateBlindReadCount(int board_No) {
		return sqlSession.update("board2Mapper.updateReadCount", board_No);		
	}

	@Override
	public int deleteBlind(int board_No) {
		return sqlSession.update("board2Mapper.deleteBoard", board_No);
	}

	@Override
	public int insertBlind(Board2 board) {
		return sqlSession.insert("board2Mapper.insertBoard", board);
	}

	@Override
	public int updateBlind(Board2 board) {
		return sqlSession.update("board2Mapper.updateBoard", board);
	}

	@Override
	public List<Map<String, String>> searchBlindList(int cPage, int numPerPage, String keyword) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board2Mapper.searchBlindList", keyword, rows);
	}

	@Override
	public int searchBlindTotalContents(String keyword) {
		return sqlSession.selectOne("board2Mapper.searchBlindTotalContents", keyword);
	}

}
