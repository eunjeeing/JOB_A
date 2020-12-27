package com.kh.joba.admin.administer.model.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO {

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
