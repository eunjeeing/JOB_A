package com.kh.joba.admin.administer.model.dao;

import java.util.List;
import java.util.Map;

public interface AdminDAO {

	List<Map<String, String>> selectAdminList(int cPage, int numPerPage);

	int selectTotalAdmin();

}
