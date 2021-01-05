package com.kh.joba.user.board2.job.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.attachment.model.vo.Attachment;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;

public interface JobDAO {
	
	List<Map<String, String>> selectJobList(int cPage, int numPerPage);

	int selectJobTotalContents();

	Board2 jobSelectOne(int board_No);

	List<Attachment> selectAttachmentList(int board_No);

	int updateJobReadCount(int board_No);

	int deleteJob(int board_No);

	int insertJob(Board2 board);

	int updateJob(Board2 board);

	List<Map<String, String>> searchJobList(int cPage, int numPerPage, String keyword);

	int searchJobTotalContents(String keyword);

	List<Map<String, String>> categorySearchJobList(int cPage, int numPerPage, int category_No);

	int categorySearchJobTotalContents(int category_No);

}
