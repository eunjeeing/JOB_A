package com.kh.joba.admin.boardManage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.admin.boardManage.model.dao.boardManageDAO;

@Service
public class boardManageServiceImpl implements boardManageService {

	@Autowired
	boardManageDAO bmd;
	
	@Override
	public List<Map<String, String>> selectJobList() {
		return bmd.selectJobList();
	}

	@Override
	public List<Map<String, String>> selectBlahBlahList() {
		return bmd.selectBlahBlahList();
	}

	@Override
	public List<Map<String, String>> selnctBlindList() {
		return bmd.selnctBlindList();
	}

	@Override
	public List<Map<String, String>> selectQnAList() {
		return bmd.selectQnAList();
	}

	@Override
	public List<Map<String, String>> selectAcceptList() {
		return bmd.selectAcceptList();
	}

	@Override
	public List<Map<String, String>> selectInterviewList() {
		return bmd.selectInterviewList();
	}


	@Override
	public List<Map<String, String>> selectMentoList() {
		return bmd.selectMentoList();
	}

	@Override
	public List<Map<String, String>> selectTomoList() {
		return bmd.selectTomoList();
	}

	@Override
	public int updateStatusY(int board_No, int type_No) {
		return bmd.updateStatusY(board_No, type_No);
	}

	@Override
	public int updateStatusB(int board_No, int type_No) {
		return bmd.updateStatusB(board_No, type_No);
	}

}
