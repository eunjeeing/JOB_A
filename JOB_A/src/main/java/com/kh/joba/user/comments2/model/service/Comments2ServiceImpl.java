package com.kh.joba.user.comments2.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.user.comments2.model.dao.Comments2DAO;
import com.kh.joba.user.comments2.model.vo.Comments2;

@Service
public class Comments2ServiceImpl implements Comments2Service {

	@Autowired
	Comments2DAO commentsDAO;
	
	@Override
	public List<Comments2> selectComment(int board_No) {
		return commentsDAO.selectComment(board_No);
	}

	@Override
	public int insertComment(Comments2 comment) {
		return commentsDAO.insertComment(comment);
	}

}
