package com.kh.joba.admin.index.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.user.board2.blahblah.model.vo.Board2;


@Repository
public class IndexDAOImpl implements IndexDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectAllCount() {
		return sqlSession.selectList("indexMapper.selectAllCount");
	}

	@Override
	public List<Map<String, String>> carouselList() {
		
		List<Map<String, String>> carouselList = sqlSession.selectList("indexMapper.selectCarouselList");
		
		return carouselList ;
	}

}
