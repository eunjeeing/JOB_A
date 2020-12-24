package com.kh.joba.admin.administer.model.dao;

import java.util.List;
import java.util.Map;

public interface UserDAO {

	List<Map<String, String>> selectUserList(int cPage, int numPerPage);

	int selectTotalUser();

}
