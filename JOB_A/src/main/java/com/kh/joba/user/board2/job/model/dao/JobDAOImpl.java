package com.kh.joba.user.board2.job.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.user.attachment.model.vo.Attachment;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;

@Repository
public class JobDAOImpl implements JobDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectJobList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board2Mapper.selectJobList", null, rows);
	}

	@Override
	public int selectJobTotalContents() {
		return sqlSession.selectOne("board2Mapper.selectJobTotalContents");
	}

	@Override
	public Board2 jobSelectOne(int board_No) {
		return sqlSession.selectOne("board2Mapper.selectOneBoard", board_No);
	}

	@Override
	public List<Attachment> selectAttachmentList(int board_No) {
		return sqlSession.selectList("board2Mapper.selectAttachmentList", board_No);
	}

	@Override
	public int updateJobReadCount(int board_No) {
		return sqlSession.update("board2Mapper.updateReadCount", board_No);
	}

	@Override
	public int deleteJob(int board_No) {
		return sqlSession.update("board2Mapper.deleteBoard", board_No);
	}

	@Override
	public int insertJob(Board2 board) {
		return sqlSession.insert("board2Mapper.insertBoard", board);
	}

	@Override
	public int updateJob(Board2 board) {
		return sqlSession.update("board2Mapper.updateBoard", board);
	}

	@Override
	public List<Map<String, String>> searchJobList(int cPage, int numPerPage, String keyword) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board2Mapper.searchJobList", keyword, rows);
	}

	@Override
	public int searchJobTotalContents(String keyword) {
		return sqlSession.selectOne("board2Mapper.searchJobTotalContents", keyword);
	}

}
