package com.kh.joba.admin.management.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.admin.management.model.dao.UserDAO;


@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;

	@Override
	public List<Map<String, String>> selectMemberList() {
		// TODO Auto-generated method stub
		return userDAO.selectMemberList();
	}



}
