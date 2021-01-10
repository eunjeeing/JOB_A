package com.kh.joba.admin.boardManage.model.dao;

import java.util.List;
import java.util.Map;

public interface boardManageDAO {

	List<Map<String, String>> selectJobList(int cPage, int numPerPage);

	int selectJobTotalContents();

	List<Map<String, String>> selectBlahBlahList(int cPage, int numPerPage);

	int selectBlahBlahTotalContents();

	List<Map<String, String>> selnctBlindList(int cPage, int numPerPage);

	int selectBlindTotalContents();

	List<Map<String, String>> selectQnAList(int cPage, int numPerPage);

	int selectQnATotalContents();

	List<Map<String, String>> selectAcceptList(int cPage, int numPerPage);

	int selectAcceptTotalContents();

	List<Map<String, String>> selectInterviewList(int cPage, int numPerPage);

	int selectInterviewTotalContents();

	List<Map<String, String>> selectMentoList(int cPage, int numPerPage);

	int selectMentoTotalContents();


}
