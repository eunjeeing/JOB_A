package com.kh.joba.user.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.user.board2.blahblah.model.vo.Board2;

@Repository
public class MypageDAOImpl implements MypageDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectMyPost(int cPage, int numPerPage, int mem_No) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("board2Mapper.selectMyPost", mem_No, rows);
	}

	@Override
	public int selectMyPostTotalContents(int mem_No) {
		return sqlSession.selectOne("board2Mapper.selectMyPostTotalContents", mem_No);
	}

	@Override
	public List<Map<String, String>> selectMyComment(int cPage, int numPerPage, int mem_No) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("comments2Mapper.selectMyComment", mem_No, rows);
	}

	@Override
	public int selectMyCommentTotalContents(int mem_No) {
		return sqlSession.selectOne("comments2Mapper.selectMyCommentTotalContents", mem_No);
	}

	@Override
	public void deleteChkPost(Board2 board) {
		sqlSession.update("board2Mapper.deleteChkPost", board);
	}

}
