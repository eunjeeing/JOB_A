package com.kh.joba.admin.administer.model.service;

import java.util.List;
import java.util.Map;

public interface AdminService {

	List<Map<String, String>> selectAdminList(int cPage, int numPerPage);

	int selectTotalAdmin();

}
