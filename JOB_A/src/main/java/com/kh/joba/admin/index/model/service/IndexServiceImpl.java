package com.kh.joba.admin.index.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.admin.index.model.dao.IndexDAO;
import com.kh.joba.user.board2.blahblah.model.vo.Board2;


@Service
public class IndexServiceImpl implements IndexService {
	@Autowired
	IndexDAO indexDAO;

	// 랭킹 서비스
	@Override
	public List<Map<String, String>> selectRank() {
		return indexDAO.selectAllCount();
	}

	@Override
	public List<Map<String, String>> selectBoard() {
		return indexDAO.carouselList();
	}

	@Override
	public List<Map<String, String>> countBoard() {
		
		return indexDAO.countBoard();
	}

	@Override
	public List<Map<String, String>> countTodayBoard() {
		// TODO Auto-generated method stub
		return indexDAO.countTodayBoard();
	}

	@Override
	public List<Map<String, String>> countTodayMember() {
		// TODO Auto-generated method stub
		return indexDAO.countTodayMember();
	}

	@Override
	public List<Map<String, String>> countTotalMember() {
		return indexDAO.countTotalMember();
	}
	
	
	
}
