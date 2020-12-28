package com.kh.joba.user.board2.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.user.board2.model.vo.Attachment2;
import com.kh.joba.user.board2.model.vo.Board2;

@Repository
public class Board2DAOImpl implements Board2DAO {

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
		return sqlSession.selectOne("board2Mapper.selectOneBlah", board_No);
	}

	@Override
	public int updateBlahReadCount(int board_No) {
		return sqlSession.update("board2Mapper.updateBlahReadCount", board_No);
		
	}

	@Override
	public List<Attachment2> selectAttachmentList(int board_No) {
		return sqlSession.selectList("board2Mapper.selectAttachmentList", board_No);

	}

}
