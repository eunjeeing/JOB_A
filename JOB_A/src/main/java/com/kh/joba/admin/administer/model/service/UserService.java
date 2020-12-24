package com.kh.joba.admin.administer.model.service;

import java.util.List;
import java.util.Map;

public interface UserService {

	List<Map<String, String>> selectUserList(int cPage, int numPerPage);

	int selectTotalUser();

}
