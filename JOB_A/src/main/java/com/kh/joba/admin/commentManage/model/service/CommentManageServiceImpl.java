package com.kh.joba.admin.commentManage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.admin.commentManage.model.dao.CommentManageDAO;

@Service
public class CommentManageServiceImpl implements CommentManageService {
	
	@Autowired
	CommentManageDAO cmd;

	@Override
	public List<Map<String, String>> jobCommentList(int cPage, int numPerPage) {
		return cmd.jobCommentList(cPage, numPerPage);
	}

	@Override
	public int jobCommentTotalContents() {
		return cmd.jobCommentTotalContents();
	}

	@Override
	public List<Map<String, String>> blahCommentList(int cPage, int numPerPage) {
		return cmd.blahCommentList(cPage, numPerPage);
	}

	@Override
	public int blahCommentTotalContents() {
		return cmd.blahCommentTotalContents();
	}

	@Override
	public List<Map<String, String>> blindCommentList(int cPage, int numPerPage) {
		return cmd.blindCommentList(cPage, numPerPage);
	}

	@Override
	public int blindCommentTotalContents() {
		return cmd.blindCommentTotalContents();
	}

	@Override
	public List<Map<String, String>> tomoCommentList(int cPage, int numPerPage) {
		return cmd.tomoCommentList(cPage, numPerPage);
	}

	@Override
	public int tomoCommentTotalContents() {
		return cmd.tomoCommentTotalContents();
	}

	@Override
	public List<Map<String, String>> qnaCommentList(int cPage, int numPerPage) {
		return cmd.qnaCommentList(cPage, numPerPage);
	}

	@Override
	public int qnaCommentTotalContents() {
		return cmd.qnaCommentTotalContents();
	}

	@Override
	public List<Map<String, String>> acceptCommentList(int cPage, int numPerPage) {
		return cmd.acceptCommentList(cPage, numPerPage);
	}

	@Override
	public int acceptCommentTotalContents() {
		return cmd.acceptCommentTotalContents();
	}

	@Override
	public List<Map<String, String>> interviewCommentList(int cPage, int numPerPage) {
		return cmd.interviewCommentList(cPage, numPerPage);
	}

	@Override
	public int interviewCommentTotalContents() {
		return cmd.interviewCommentTotalContents();
	}

	@Override
	public List<Map<String, String>> mentoCommentList(int cPage, int numPerPage) {
		return cmd.mentoCommentList(cPage, numPerPage);
	}

	@Override
	public int mentoCommentTotalContents() {
		return cmd.mentoCommentTotalContents();
	}


}
