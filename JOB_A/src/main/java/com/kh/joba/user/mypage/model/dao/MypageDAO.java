package com.kh.joba.user.mypage.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.comments2.model.vo.Comments2;

public interface MypageDAO {

	List<Map<String, String>> selectMyPost(int cPage, int numPerPage, int mem_No);

	int selectMyPostTotalContents(int mem_No);

	List<Map<String, String>> selectMyComment(int cPage, int numPerPage, int mem_No);

	int selectMyCommentTotalContents(int mem_No);
	
	void deleteChkPost(Board2 board);

	void deleteChkComment(Comments2 comment);

}
