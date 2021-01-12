package com.kh.joba.admin.visitor.model.dao;

import java.sql.Connection;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.joba.admin.visitor.model.vo.VisitCount;


public interface VisitCountDAO {
	
	int getVisitTodayCount(SqlSessionTemplate sqlSession);

	int getVisitTotalCount(SqlSessionTemplate sqlSession);

	int setVisitTotalCount(SqlSessionTemplate sqlSession, VisitCount vs);
}
