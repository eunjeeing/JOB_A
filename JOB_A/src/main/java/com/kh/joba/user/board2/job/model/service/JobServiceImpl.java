package com.kh.joba.user.board2.job.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.user.attachment.model.vo.Attachment;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.board2.job.model.dao.JobDAO;
import com.kh.joba.user.common.exception.BoardException;

@Service
public class JobServiceImpl implements JobService {

	@Autowired
	JobDAO jd;
	
	@Override
	public List<Map<String, String>> selectJobList(int cPage, int numPerPage) {
		return jd.selectJobList(cPage, numPerPage);
	}

	@Override
	public int selectJobTotalContents() {
		return jd.selectJobTotalContents();
	}

	@Override
	public Board2 jobSelectOne(int board_No) {
		Board2 board = jd.jobSelectOne(board_No);
		
		if( board != null ) jd.updateJobReadCount(board_No);
		
		return board;
	}

	@Override
	public List<Attachment> selectAttachmentList(int board_No) {
		return jd.selectAttachmentList(board_No);
	}

	@Override
	public int deleteJob(int board_No) {
		return jd.deleteJob(board_No);
	}

	@Override
	public int insertJob(Board2 board) {
		int result = 0;
		
		result = jd.insertJob(board);
		if(result<1) throw new BoardException("게시글 추가 중 에러 발생");
		
		return result;
	}

	@Override
	public int updateJob(Board2 board) {
		return jd.updateJob(board);
	}

	@Override
	public List<Map<String, String>> searchJobList(int cPage, int numPerPage, String keyword) {
		return jd.searchJobList(cPage, numPerPage, keyword);
	}

	@Override
	public int searchJobTotalContents(String keyword) {
		return jd.searchJobTotalContents(keyword);
	}

}
