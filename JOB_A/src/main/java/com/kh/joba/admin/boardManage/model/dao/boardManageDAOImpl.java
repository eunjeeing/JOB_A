package com.kh.joba.admin.boardManage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class boardManageDAOImpl implements boardManageDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectJobList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("boardM-Mapper.selectJobList", null, rows);
	}

	@Override
	public int selectJobTotalContents() {
		return sqlSession.selectOne("boardM-Mapper.selectJobTotalContents");
	}

	@Override
	public List<Map<String, String>> selectBlahBlahList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("boardM-Mapper.selectBlahBlahList", null, rows);
	}

	@Override
	public int selectBlahBlahTotalContents() {
		return sqlSession.selectOne("boardM-Mapper.selectBlahBlahTotalContents");
	}

	@Override
	public List<Map<String, String>> selnctBlindList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("boardM-Mapper.selectBlindList", null, rows);
	}

	@Override
	public int selectBlindTotalContents() {
		return sqlSession.selectOne("boardM-Mapper.selectBlindTotalContents");
	}

	@Override
	public List<Map<String, String>> selectQnAList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("boardM-Mapper.selectQnAList", null, rows);
	}

	@Override
	public int selectQnATotalContents() {
		return sqlSession.selectOne("boardM-Mapper.selectQnATotalContents");
	}

	@Override
	public List<Map<String, String>> selectAcceptList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("boardM-Mapper.selectAcceptList", null, rows);
	}

	@Override
	public int selectAcceptTotalContents() {
		return sqlSession.selectOne("boardM-Mapper.selectAcceptTotalContents");
	}

	@Override
	public List<Map<String, String>> selectInterviewList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("boardM-Mapper.selectInterviewList", null, rows);
	}

	@Override
	public int selectInterviewTotalContents() {
		return sqlSession.selectOne("boardM-Mapper.selectInterviewTotalContents");
	}

	@Override
	public List<Map<String, String>> selectMentoList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("boardM-Mapper.selectMentoList", null, rows);
	}

	@Override
	public int selectMentoTotalContents() {
		return sqlSession.selectOne("boardM-Mapper.selectMentoTotalContents");
	}

	@Override
	public List<Map<String, String>> selectTomoList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("boardM-Mapper.selectTomoList", null, rows);
	}

	@Override
	public int selectTomoTotalContents() {
		return sqlSession.selectOne("boardM-Mapper.selectTomoTotalContents");
	}

	@Override
	public List<Map<String, String>> searchJobList(int cPage, int numPerPage, String keyword) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("boardM-Mapper.searchJobList", keyword, rows);
	}

	@Override
	public int searchJobTotalContents(String keyword) {
		return sqlSession.selectOne("boardM-Mapper.searchJobTotalContents");
	}

	@Override
	public int updateJobStatus(int board_No) {
		return sqlSession.update("boardM-Mapper.updateStatus", board_No);
	}

}
