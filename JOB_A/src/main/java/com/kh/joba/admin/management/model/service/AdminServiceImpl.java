package com.kh.joba.admin.management.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.admin.management.model.dao.AdminDAO;
import com.kh.joba.admin.management.model.vo.Admin;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDAO;
	
	@Override
	public List<Map<String, String>> selectAdminList() {
		// TODO Auto-generated method stub
		return adminDAO.selectAdminList();
	}

	@Override
	public int insertAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return adminDAO.insertAdmin(admin);
	}

	@Override
	public int deleteAdmin(int adminNo) {
		// TODO Auto-generated method stub
		return adminDAO.deleteAdmin(adminNo);
	}

	
	/******************************************************************/

	@Override
	public Admin selectAdmin(int adminNo) {
		// TODO Auto-generated method stub
		return adminDAO.selectAdmin(adminNo);
	}
	
	@Override
	public int updateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return adminDAO.updateAdmin(admin);
	}


}
