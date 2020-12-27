package com.kh.joba.admin.administer.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.admin.administer.model.dao.AdminDAO;

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

}
