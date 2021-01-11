package com.kh.joba.admin.commentManage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentManageDAOImpl implements CommentManageDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> jobCommentList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("commnetM-Mapper.jobCommentList", null, rows);
	}

	@Override
	public int jobCommentTotalContents() {
		return sqlSession.selectOne("commnetM-Mapper.jobCommentTotalContents");
	}

	@Override
	public List<Map<String, String>> blahCommentList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("commnetM-Mapper.blahCommentList", null, rows);
	}

	@Override
	public int blahCommentTotalContents() {
		return sqlSession.selectOne("commnetM-Mapper.blahCommentTotalContents");
	}

	@Override
	public List<Map<String, String>> blindCommentList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("commnetM-Mapper.blindCommentList", null, rows);
	}

	@Override
	public int blindCommentTotalContents() {
		return sqlSession.selectOne("commnetM-Mapper.blindCommentTotalContents");
	}

	@Override
	public List<Map<String, String>> tomoCommentList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("commnetM-Mapper.tomoCommentList", null, rows);
	}

	@Override
	public int tomoCommentTotalContents() {
		return sqlSession.selectOne("commnetM-Mapper.tomoCommentTotalContents");
	}

	@Override
	public List<Map<String, String>> qnaCommentList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("commnetM-Mapper.qnaCommentList", null, rows);
	}

	@Override
	public int qnaCommentTotalContents() {
		return sqlSession.selectOne("commnetM-Mapper.qnaCommentTotalContents");
	}

	@Override
	public List<Map<String, String>> acceptCommentList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("commnetM-Mapper.acceptCommentList", null, rows);
	}

	@Override
	public int acceptCommentTotalContents() {
		return sqlSession.selectOne("commnetM-Mapper.acceptCommentTotalContents");
	}

	@Override
	public List<Map<String, String>> interviewCommentList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("commnetM-Mapper.interviewCommentList", null, rows);
	}

	@Override
	public int interviewCommentTotalContents() {
		return sqlSession.selectOne("commnetM-Mapper.interviewCommentTotalContents");
	}

	@Override
	public List<Map<String, String>> mentoCommentList(int cPage, int numPerPage) {
		RowBounds rows = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("commnetM-Mapper.mentoCommentList", null, rows);
	}

	@Override
	public int mentoCommentTotalContents() {
		return sqlSession.selectOne("commnetM-Mapper.mentoCommentTotalContents");
	}

}
