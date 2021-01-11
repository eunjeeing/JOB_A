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
	public List<Map<String, String>> selectJobList(int cPage, int numPerPage) {
		return bmd.selectJobList(cPage, numPerPage);
	}

	@Override
	public int selectJobTotalContents() {
		return bmd.selectJobTotalContents();
	}

	@Override
	public List<Map<String, String>> selectBlahBlahList(int cPage, int numPerPage) {
		return bmd.selectBlahBlahList(cPage, numPerPage);
	}

	@Override
	public int selectBlahBlahTotalContents() {
		return bmd.selectBlahBlahTotalContents();
	}

	@Override
	public List<Map<String, String>> selnctBlindList(int cPage, int numPerPage) {
		return bmd.selnctBlindList(cPage, numPerPage);
	}

	@Override
	public int selectBlindTotalContents() {
		return bmd.selectBlindTotalContents();
	}

	@Override
	public List<Map<String, String>> selectQnAList(int cPage, int numPerPage) {
		return bmd.selectQnAList(cPage, numPerPage);
	}

	@Override
	public int selectQnATotalContents() {
		return bmd.selectQnATotalContents();
	}

	@Override
	public List<Map<String, String>> selectAcceptList(int cPage, int numPerPage) {
		return bmd.selectAcceptList(cPage, numPerPage);
	}

	@Override
	public int selectAcceptTotalContents() {
		return bmd.selectAcceptTotalContents();
	}

	@Override
	public List<Map<String, String>> selectInterviewList(int cPage, int numPerPage) {
		return bmd.selectInterviewList(cPage, numPerPage);
	}

	@Override
	public int selectInterviewTotalContents() {
		return bmd.selectInterviewTotalContents();
	}

	@Override
	public List<Map<String, String>> selectMentoList(int cPage, int numPerPage) {
		return bmd.selectMentoList(cPage, numPerPage);
	}

	@Override
	public int selectMentoTotalContents() {
		return bmd.selectMentoTotalContents();
	}

	@Override
	public List<Map<String, String>> selectTomoList(int cPage, int numPerPage) {
		return bmd.selectTomoList(cPage, numPerPage);
	}

	@Override
	public int selectTomoTotalContents() {
		return bmd.selectTomoTotalContents();
	}

	@Override
	public List<Map<String, String>> searchJobList(int cPage, int numPerPage, String keyword) {
		return bmd.searchJobList(cPage, numPerPage, keyword);
	}

	@Override
	public int searchJobTotalContents(String keyword) {
		return bmd.searchJobTotalContents(keyword);
	}

	@Override
	public int updateJobStatus(int board_No) {
		return bmd.updateJobStatus(board_No);
	}

}
