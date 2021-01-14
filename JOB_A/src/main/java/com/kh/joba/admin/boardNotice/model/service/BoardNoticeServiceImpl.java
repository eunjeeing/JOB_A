package com.kh.joba.admin.boardNotice.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.admin.boardNotice.model.dao.BoardNoticeDAO;

@Service
public class BoardNoticeServiceImpl implements BoardNoticeService{
	
	@Autowired
	BoardNoticeDAO bnDAO;

	@Override
	public List<Map<String, String>> noticeList() {
		return bnDAO.noticeList();
	}
	
	
}
