package com.kh.joba.admin.boardNotice.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.user.board.model.vo.Board1;

@Repository
public class BoardNoticeDAOImpl implements BoardNoticeDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> noticeList() {
		return sqlSession.selectList("adminBoard.noticeList");
	}

	@Override
	public List<Map<String, String>> adminNoticeList() {
		return sqlSession.selectList("adminBoard.adminNoticeList");
	}

	@Override
	public Board1 selectOneNotice(int board_no) {
		return sqlSession.selectOne("adminBoard.selectOneNotice", board_no);
	}

	@Override
	public int updateNotice(Board1 notice) {
		return sqlSession.update("adminBoard.updateNotice", notice);
	}

	@Override
	public int deleteNotice(int board_no) {
		return sqlSession.delete("adminBoard.deleteNotice", board_no);
	}

	@Override
	public int insertNotice(Board1 notice) {
		System.out.println("admin DAO Impl 까지 도착");

		return sqlSession.insert("adminBoard.insertNotice", notice);
	}

	@Override
	public int insertAdminNotice(Board1 notice) {
		System.out.println("admin DAO Impl 까지 도착");

		return sqlSession.insert("adminBoard.insertAdminNotice", notice);
	}

	@Override
	public Board1 selectOneAdminNotice(int board_no) {
		return sqlSession.selectOne("adminBoard.selectOneAdminNotice", board_no);
	}
	
	
	
	

	@Override
	public List<Map<String, String>> selectMentoTotalList() {
		return sqlSession.selectList("adminBoard.selectMentoTotalList");
	}

	@Override
	public List<Map<String, String>> selectMentoAnsweredList() {
		return sqlSession.selectList("adminBoard.selectMentoAnsweredList");
	}

	@Override
	public List<Map<String, String>> selectMentoUnansweredList() {
		return sqlSession.selectList("adminBoard.selectMentoUnansweredList");
	}
	@Override
	public Board1 selectOneMento(int board_no) {
		return sqlSession.selectOne("adminBoard.selectOneMento", board_no);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
