package com.kh.joba.admin.management.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.joba.admin.management.model.vo.Admin;

public interface AdminDAO {

	List<Map<String, String>> selectAdminList();

	int insertAdmin(Admin admin);

	int deleteAdmin(int adminNo);

	Admin selectAdmin(int adminNo);

	int updateAdmin(Admin admin);
}
