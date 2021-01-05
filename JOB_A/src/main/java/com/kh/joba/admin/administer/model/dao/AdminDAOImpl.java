package com.kh.joba.admin.administer.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kh.joba.admin.administer.model.vo.Admin;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectAdminList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("adminMapper.selectAdminList", null, rows);
	}

	@Override
	public int selectTotalAdmin() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectTotalAdmin");
	}

	@Override
	public int insertAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminMapper.insertAdmin");
	}

	@Override
	public int deleteAdmin(int memNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("adminMapper.deleteAdmin");
	}

	
	/******************************************************************/

	@Override
	public Admin selectAdmin(int memNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectAdmin");
	}
	
	@Override
	public int updateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateAdmin");
	}


}
