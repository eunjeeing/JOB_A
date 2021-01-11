package com.kh.joba.admin.commentManage.model.service;

import java.util.List;
import java.util.Map;

public interface CommentManageService {


	List<Map<String, String>> jobCommentList(int cPage, int numPerPage);

	int jobCommentTotalContents();

	List<Map<String, String>> blahCommentList(int cPage, int numPerPage);

	int blahCommentTotalContents();

	List<Map<String, String>> blindCommentList(int cPage, int numPerPage);

	int blindCommentTotalContents();

	List<Map<String, String>> tomoCommentList(int cPage, int numPerPage);

	int tomoCommentTotalContents();

	List<Map<String, String>> qnaCommentList(int cPage, int numPerPage);

	int qnaCommentTotalContents();

	List<Map<String, String>> acceptCommentList(int cPage, int numPerPage);

	int acceptCommentTotalContents();

	List<Map<String, String>> interviewCommentList(int cPage, int numPerPage);

	int interviewCommentTotalContents();

	List<Map<String, String>> mentoCommentList(int cPage, int numPerPage);

	int mentoCommentTotalContents();
}
