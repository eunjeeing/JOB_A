package com.kh.joba.user.mypage.model.service;

import java.util.List;
import java.util.Map;

public interface MypageService {

	List<Map<String, String>> selectMyPost(int cPage, int numPerPage, int mem_No);

	int selectMyPostTotalContents(int mem_No);

}
