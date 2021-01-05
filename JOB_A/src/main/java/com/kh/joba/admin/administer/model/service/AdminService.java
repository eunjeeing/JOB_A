package com.kh.joba.admin.administer.model.service;

import java.util.List;
import java.util.Map;

import com.kh.joba.admin.administer.model.vo.Admin;

public interface AdminService {

	List<Map<String, String>> selectAdminList(int cPage, int numPerPage);

	int selectTotalAdmin();

	int insertAdmin(Admin admin);

	int deleteAdmin(int adminNo);

	Admin selectAdmin(String memId);
	
	int updateAdmin(Admin admin);


}
