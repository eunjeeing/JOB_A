package com.kh.joba.admin.index.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IndexDAOImpl implements IndexDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int selectAllCount() {
		return sqlSession.selectOne("indexMapper.selectAllCount");
	}

}
