package com.kh.joba.user.search.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.user.search.model.vo.Search;

@Repository
public class SearchDAOImpl implements SearchDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> searchList(int cPage, int numPerPage, String keyword) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("searchMapper.searchList", keyword, rows);
	}

	@Override
	public int searchTotalContents(String keyword) {
		
		return sqlSession.selectOne("searchMapper.searchTotalContents", keyword);
	}

}
