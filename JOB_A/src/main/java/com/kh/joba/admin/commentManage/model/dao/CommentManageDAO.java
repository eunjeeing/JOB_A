package com.kh.joba.admin.commentManage.model.dao;

import java.util.List;
import java.util.Map;

public interface CommentManageDAO {
	
	List<Map<String, String>> jobCommentList();

	List<Map<String, String>> blahCommentList();

	List<Map<String, String>> blindCommentList();

	List<Map<String, String>> tomoCommentList();

	List<Map<String, String>> qnaCommentList();

	List<Map<String, String>> acceptCommentList();

	List<Map<String, String>> interviewCommentList();

	List<Map<String, String>> mentoCommentList();

	int updateCommStatusB(int comm_No, int type_No);

	int updateCommStatusY(int comm_No, int type_No);

}
