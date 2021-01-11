package com.kh.joba.admin.management.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.admin.management.model.vo.Admin;
import com.kh.joba.user.member.model.vo.Member;

@Repository
public class AdminDAOImpl implements AdminDAO{

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectAdminList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.selectAdminList");
	}

	@Override
	public int insertAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminMapper.insertAdmin", admin);
	}

	@Override
	public int deleteAdmin(int adminNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("adminMapper.deleteAdmin", adminNo);
	}

	@Override
	public Admin selectAdmin(int adminNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectAdmin", adminNo);
	}
	
	@Override
	public int updateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.updateAdmin", admin);
	}

	
	/******************************************************************/
	
	@Override
	public List<Map<String, String>> selectMemberList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memberMapper.selectMemberList");
	}

	@Override
	public List<Map<String, String>> selectBoardList(int memNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.selectBoardList", memNo);
	}

	@Override
	public List<Map<String, String>> selectCommentList(int memNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.selectCommentList", memNo);
	}

	@Override
	public List<Map<String, String>> selectReportBoardList(int memNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.selectReportBoardList", memNo);
	}

	@Override
	public List<Map<String, String>> selectReportCommentList(int memNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("adminMapper.selectReportCommentList", memNo);
	}

	@Override
	public List<Map<String, String>> selectMember(int memNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("memberMapper.selectMember", memNo);
	}


}
