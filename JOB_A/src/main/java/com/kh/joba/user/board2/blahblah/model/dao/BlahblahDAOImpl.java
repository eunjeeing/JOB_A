package com.kh.joba.user.board2.blahblah.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.user.attachment.model.vo.Attachment;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;

@Repository
public class BlahblahDAOImpl implements BlahblahDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectBlahBlahList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board2Mapper.selectBlahBlahList", null, rows);
	}

	@Override
	public int selectBlahBlahTotalContents() {
		return sqlSession.selectOne("board2Mapper.selectBlahBlahTotalContents");

	}

	@Override
	public Board2 selectOneBlah(int board_No) {
		return sqlSession.selectOne("board2Mapper.selectOneBoard", board_No);
	}

	@Override
	public int updateBlahReadCount(int board_No) {
		return sqlSession.update("board2Mapper.updateReadCount", board_No);
		
	}

	@Override
	public List<Attachment> selectAttachmentList(int board_No) {
		return sqlSession.selectList("board2Mapper.selectAttachmentList", board_No);

	}

	@Override
	public int blahDelete(int board_No) {
		return sqlSession.update("board2Mapper.deleteBoard", board_No);
	}

	@Override
	public int insertBlah(Board2 board) {
		return sqlSession.insert("board2Mapper.insertBoard", board);
	}

	@Override
	public int updateBlah(Board2 board) {
		return sqlSession.update("board2Mapper.updateBoard", board);
	}

	@Override
	public List<Map<String, String>> searchBlahList(int cPage, int numPerPage, String keyword) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board2Mapper.searchBlahList", keyword, rows);
	}

	@Override
	public int searchBlahTotalContents(String keyword) {
		return sqlSession.selectOne("board2Mapper.searchBlahTotalContents", keyword);
	}


}
