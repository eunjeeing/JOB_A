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
	public List<Board2> selectRank() {
		return indexDAO.selectAllCount();
	}

	@Override
	public List<Map<String, String>> selectBoard() {
		return indexDAO.carouselList();
	}
	
	
	
}
