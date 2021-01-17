package com.kh.joba.admin.index.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class IndexDAOImpl implements IndexDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectAllCount() {
		List<Map<String, String>> cateList= sqlSession.selectList("indexMapper.selectAllCount");
		
		return cateList;
	}

	@Override
	public List<Map<String, String>> carouselList() {
		
		List<Map<String, String>> carouselList = sqlSession.selectList("indexMapper.selectCarouselList");
		
		return carouselList ;
	}

	@Override
	public List<Map<String, String>> countBoard() {
		
		List<Map<String, String>> boardCount = sqlSession.selectList("indexMapper.countBoard");
		
		return boardCount;
	}

	@Override
	public List<Map<String, String>> countTodayBoard() {
		
		List<Map<String, String>> todayBoardCount = sqlSession.selectList("indexMapper.countTodayBoard"); 
		return todayBoardCount;
	}

	@Override
	public List<Map<String, String>> countTodayMember() {
		List<Map<String, String>> countTodayMember = sqlSession.selectList("indexMapper.countTodayMember"); 
		return countTodayMember;
	}

	@Override
	public List<Map<String, String>> countTotalMember() {
		List<Map<String, String>> countTotalMember = sqlSession.selectList("indexMapper.countTotalMember"); 
		return countTotalMember;
	}

}
