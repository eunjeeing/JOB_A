package com.kh.joba.user.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		return sqlSession.selectOne("board2Mapper.selectMyPostTotalContents");
	}

}
