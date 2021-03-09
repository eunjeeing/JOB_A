package com.kh.joba.admin.boardManage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.comments2.model.vo.Comments2;

@Repository
public class boardManageDAOImpl implements boardManageDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public List<Map<String, String>> selectJobList() {
		return sqlSession.selectList("boardM-Mapper.selectJobList");
	}

	@Override
	public List<Map<String, String>> selectBlahBlahList() {
		return sqlSession.selectList("boardM-Mapper.selectBlahBlahList");
	}

	@Override
	public List<Map<String, String>> selnctBlindList() {
		return sqlSession.selectList("boardM-Mapper.selectBlindList");
	}

	@Override
	public List<Map<String, String>> selectQnAList() {
		return sqlSession.selectList("boardM-Mapper.selectQnAList");
	}

	@Override
	public List<Map<String, String>> selectAcceptList() {
		return sqlSession.selectList("boardM-Mapper.selectAcceptList");
	}

	@Override
	public List<Map<String, String>> selectInterviewList() {
		return sqlSession.selectList("boardM-Mapper.selectInterviewList");
	}

	@Override
	public List<Map<String, String>> selectMentoList() {
		return sqlSession.selectList("boardM-Mapper.selectMentoList");
	}

	@Override
	public List<Map<String, String>> selectTomoList() {
		return sqlSession.selectList("boardM-Mapper.selectTomoList");
	}

	@Override
	public int updateStatusY(int board_No, int type_No) {
		return sqlSession.update("boardM-Mapper.updateStatusY", board_No);
	}
	
	@Override
	public int updateStatusB(int board_No, int type_No) {
		return sqlSession.update("boardM-Mapper.updateStatusB", board_No);
	}

	@Override
	public Board2 selectOneBoard(int board_No) {
		return sqlSession.selectOne("boardM-Mapper.selectOneBoard", board_No);
	}

	@Override
	public List<Comments2> selectComment(int board_No) {
		return sqlSession.selectList("boardM-Mapper.selectComment", board_No);
	}




}
