package com.kh.joba.admin.visitor.model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.admin.visitor.model.vo.VisitCount;

public class VisitCountDAOImpl implements VisitCountDAO {
		
	public int setVisitTotalCount(SqlSessionTemplate sqlSession, VisitCount vs) {
		
		return sqlSession.insert("visitCountMapper.insertVisitor", vs);
	}
	
	@Override
	public int getVisitTodayCount(SqlSessionTemplate sqlSession) {
			return sqlSession.selectOne("visitCountMapper.selectTodayVisitor");

	}

	@Override
	public int getVisitTotalCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("visitCountMapper.selectAllVistor");
	}


}
