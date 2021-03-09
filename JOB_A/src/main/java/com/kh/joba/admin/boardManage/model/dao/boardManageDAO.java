package com.kh.joba.admin.boardManage.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.board2.blahblah.model.vo.Board2;
import com.kh.joba.user.comments2.model.vo.Comments2;

public interface boardManageDAO {

	List<Map<String, String>> selectJobList();

	List<Map<String, String>> selectBlahBlahList();

	List<Map<String, String>> selnctBlindList();

	List<Map<String, String>> selectQnAList();

	List<Map<String, String>> selectAcceptList();

	List<Map<String, String>> selectInterviewList();

	List<Map<String, String>> selectMentoList();

	List<Map<String, String>> selectTomoList();

	int updateStatusY(int board_No, int type_No);

	int updateStatusB(int board_No, int type_No);

	Board2 selectOneBoard(int board_No);

	List<Comments2> selectComment(int board_No);



}
