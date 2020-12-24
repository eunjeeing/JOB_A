package com.kh.joba.admin.administer.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.admin.administer.model.dao.UserDAO;


@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;

	@Override
	public List<Map<String, String>> selectUserList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int selectTotalUser() {
		// TODO Auto-generated method stub
		return 0;
	}


}
