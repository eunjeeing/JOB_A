package com.kh.joba.admin.commentManage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.comments2.model.vo.Comments2;

@Repository
public class CommentManageDAOImpl implements CommentManageDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> jobCommentList() {
		return sqlSession.selectList("commentM-Mapper.jobCommentList");
	}

	@Override
	public List<Map<String, String>> blahCommentList() {
		return sqlSession.selectList("commentM-Mapper.blahCommentList");
	}

	@Override
	public List<Map<String, String>> blindCommentList() {
		return sqlSession.selectList("commentM-Mapper.blindCommentList");
	}

	@Override
	public List<Map<String, String>> tomoCommentList() {
		return sqlSession.selectList("commentM-Mapper.tomoCommentList");
	}

	@Override
	public List<Map<String, String>> qnaCommentList() {
		return sqlSession.selectList("commentM-Mapper.qnaCommentList");
	}

	@Override
	public List<Map<String, String>> acceptCommentList() {
		return sqlSession.selectList("commentM-Mapper.acceptCommentList");
	}

	@Override
	public List<Map<String, String>> interviewCommentList() {
		return sqlSession.selectList("commentM-Mapper.interviewCommentList");
	}

	@Override
	public List<Map<String, String>> mentoCommentList() {
		return sqlSession.selectList("commentM-Mapper.mentoCommentList");
	}

	@Override
	public int updateCommStatusB(int comm_No, int type_No) {
		return sqlSession.update("commentM-Mapper.updateCommStatusB", comm_No);
	}

	@Override
	public int updateCommStatusY(int comm_No, int type_No) {
		return sqlSession.update("commentM-Mapper.updateCommStatusY", comm_No);
	}



}
