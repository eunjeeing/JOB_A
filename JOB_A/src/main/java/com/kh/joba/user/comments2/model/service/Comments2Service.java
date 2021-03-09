package com.kh.joba.user.comments2.model.service;

import java.util.List;

import com.kh.joba.user.comments2.model.vo.Comments2;

public interface Comments2Service {
	
	public List<Comments2> selectComment(int board_No);

	public int insertComment(Comments2 comment);

	public int deleteComment(Comments2 comment);

	public int updateComment(Comments2 comment);
}
