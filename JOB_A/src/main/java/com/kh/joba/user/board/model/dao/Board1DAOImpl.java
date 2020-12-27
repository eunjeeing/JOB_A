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
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		List<Map<String, String>> result = sqlSession.selectList("board1Mapper.selectBoardList", null, rows);
		System.out.println("DAO : " + result);
		return result;
	}

	@Override
	public int selectBoardTotalContents() {
		return sqlSession.selectOne("board1Mapper.selectBoardTotalContents");
	}

}
