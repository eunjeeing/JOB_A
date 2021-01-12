package com.kh.joba.admin.index.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.admin.index.model.dao.IndexDAO;


@Service
public class IndexServiceImpl implements IndexService {
	@Autowired
	IndexDAO indexDAO;

	// 랭킹 서비스
	@Override
	public int selectRank() {
		return indexDAO.selectAllCount();
	}
	
	
	
}
