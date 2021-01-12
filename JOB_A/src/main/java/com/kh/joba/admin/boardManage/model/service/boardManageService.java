package com.kh.joba.admin.boardManage.model.service;

import java.util.List;
import java.util.Map;

public interface boardManageService {

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


}
