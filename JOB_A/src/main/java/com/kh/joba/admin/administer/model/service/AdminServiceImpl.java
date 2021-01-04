package com.kh.joba.admin.administer.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.admin.administer.model.dao.AdminDAO;
import com.kh.joba.admin.administer.model.vo.Admin;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDAO adminDAO;
	
	@Override
	public List<Map<String, String>> selectAdminList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return adminDAO.selectAdminList(cPage, numPerPage);
	}

	@Override
	public int selectTotalAdmin() {
		// TODO Auto-generated method stub
		return adminDAO.selectTotalAdmin();
	}

	@Override
	public int insertAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return adminDAO.insertAdmin();
	}

	@Override
	public int deleteAdmin(String adminId) {
		// TODO Auto-generated method stub
		return adminDAO.deleteAdmin();
	}

	
	/******************************************************************/

	@Override
	public int updateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return adminDAO.updateAdmin();
	}

}
