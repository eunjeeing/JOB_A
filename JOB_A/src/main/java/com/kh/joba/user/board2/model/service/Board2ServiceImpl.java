package com.kh.joba.user.board2.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.user.board2.model.dao.Board2DAO;

@Service
public class Board2ServiceImpl implements Board2Service {
	
	@Autowired
	Board2DAO boardDAO;

	@Override
	public List<Map<String, String>> selectBlahBlahList(int cPage, int numPerPage) {
		return boardDAO.selectBlahBlahList(cPage, numPerPage);
	}

	@Override
	public int selectBlahBlahTotalContents() {
		return boardDAO.selectBlahBlahTotalContents();
	}

}
