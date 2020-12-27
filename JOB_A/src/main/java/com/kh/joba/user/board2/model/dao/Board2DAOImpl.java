package com.kh.joba.user.board2.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
