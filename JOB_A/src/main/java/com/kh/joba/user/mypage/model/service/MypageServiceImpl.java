package com.kh.joba.user.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.comments2.model.vo.Comments2;
import com.kh.joba.user.mypage.model.dao.MypageDAO;

@Service
public class MypageServiceImpl implements MypageService {

	@Autowired
	MypageDAO md;
	
	@Override
	public List<Map<String, String>> selectMyPost(int cPage, int numPerPage, int mem_No) {
		return md.selectMyPost(cPage, numPerPage, mem_No);
	}


	@Override
	public int selectMyPostTotalContents(int mem_No) {
		return md.selectMyPostTotalContents(mem_No);
	}


	@Override
	public List<Map<String, String>> selectMyComment(int cPage, int numPerPage, int mem_No) {
		return md.selectMyComment(cPage, numPerPage, mem_No);
	}


	@Override
	public int selectMyCommentTotalContents(int mem_No) {
		return md.selectMyCommentTotalContents(mem_No);
	}


	@Override
	public void deleteChkPost(Board2 board) {
		md.deleteChkPost(board);
	}


	@Override
	public void deleteChkComment(Comments2 comment) {
		md.deleteChkComment(comment);
	}


}
