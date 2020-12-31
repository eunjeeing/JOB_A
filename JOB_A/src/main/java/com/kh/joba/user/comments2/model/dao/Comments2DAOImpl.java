package com.kh.joba.user.comments2.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.user.comments2.model.vo.Comments2;

@Repository
public class Comments2DAOImpl implements Comments2DAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Comments2> selectComment(int board_No) {
		return sqlSession.selectList("comments2Mapper.selectComment", board_No);
	}

	@Override
	public int insertComment(Comments2 comment) {
		return sqlSession.insert("comments2Mapper.insertComment", comment);
	}

	@Override
	public int deleteComment(Comments2 comment) {
		return sqlSession.update("comments2Mapper.deleteComment", comment);
	}

	@Override
	public int updateComment(Comments2 comment) {
		return sqlSession.update("comments2Mapper.updateComment", comment);
	}

}
