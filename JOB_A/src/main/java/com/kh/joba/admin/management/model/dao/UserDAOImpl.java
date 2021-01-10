package com.kh.joba.admin.management.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectMemberList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memberMapper.selectMemberList");
	}


}
