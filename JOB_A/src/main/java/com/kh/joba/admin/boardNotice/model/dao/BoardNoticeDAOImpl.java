package com.kh.joba.admin.boardNotice.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardNoticeDAOImpl implements BoardNoticeDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> noticeList() {
		return sqlSession.selectList("adminBoard.noticeList");
	}
	
	
	
}
