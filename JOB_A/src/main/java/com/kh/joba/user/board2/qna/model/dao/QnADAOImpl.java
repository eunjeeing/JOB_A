package com.kh.joba.user.board2.qna.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.user.attachment.model.vo.Attachment;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;

@Repository
public class QnADAOImpl implements QnADAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectQnAList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board2Mapper.selectQnAList", null, rows);
	}

	@Override
	public int selectQnATotalContents() {
		return sqlSession.selectOne("board2Mapper.selectQnATotalContents");

	}

	@Override
	public Board2 qnaSelectOne(int board_No) {
		return sqlSession.selectOne("board2Mapper.selectOneBoard", board_No);
	}

	@Override
	public List<Attachment> selectAttachmentList(int board_No) {
		return sqlSession.selectList("board2Mapper.selectAttachmentList", board_No);
	}

	@Override
	public int updateQnAReadCount(int board_No) {
		return sqlSession.update("board2Mapper.updateReadCount", board_No);
	}

	@Override
	public int deleteQnA(int board_No) {
		return sqlSession.update("board2Mapper.deleteBoard", board_No);
	}

	@Override
	public int insertQnA(Board2 board) {
		return sqlSession.insert("board2Mapper.insertBoard", board);
	}

	@Override
	public int updateQnA(Board2 board) {
		return sqlSession.update("board2Mapper.updateBoard", board);
	}

	@Override
	public List<Map<String, String>> searchQnAList(int cPage, int numPerPage, String keyword) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board2Mapper.searchQnAList", keyword, rows);
	}

	@Override
	public int searchQnATotalContents(String keyword) {
		return sqlSession.selectOne("board2Mapper.searchQnATotalContents", keyword);
	}

}
