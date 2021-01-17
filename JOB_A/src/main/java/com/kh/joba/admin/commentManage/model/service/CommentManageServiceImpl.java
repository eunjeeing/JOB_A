package com.kh.joba.admin.commentManage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.admin.commentManage.model.dao.CommentManageDAO;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;

@Service
public class CommentManageServiceImpl implements CommentManageService {
	
	@Autowired
	CommentManageDAO cmd;

	@Override
	public List<Map<String, String>> jobCommentList() {
		return cmd.jobCommentList();
	}

	@Override
	public List<Map<String, String>> blahCommentList() {
		return cmd.blahCommentList();
	}

	@Override
	public List<Map<String, String>> blindCommentList() {
		return cmd.blindCommentList();
	}

	@Override
	public List<Map<String, String>> tomoCommentList() {
		return cmd.tomoCommentList();
	}

	@Override
	public List<Map<String, String>> qnaCommentList() {
		return cmd.qnaCommentList();
	}

	@Override
	public List<Map<String, String>> acceptCommentList() {
		return cmd.acceptCommentList();
	}

	@Override
	public List<Map<String, String>> interviewCommentList() {
		return cmd.interviewCommentList();
	}

	@Override
	public List<Map<String, String>> mentoCommentList() {
		return cmd.mentoCommentList();
	}

	@Override
	public int updateCommStatusB(int comm_No, int type_No) {
		return cmd.updateCommStatusB(comm_No, type_No);
	}

	@Override
	public int updateCommStatusY(int comm_No, int type_No) {
		return cmd.updateCommStatusY(comm_No, type_No);
	}



}
