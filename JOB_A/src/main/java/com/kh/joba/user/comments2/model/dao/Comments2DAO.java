package com.kh.joba.user.comments2.model.dao;

import java.util.List;

import com.kh.joba.user.comments2.model.vo.Comments2;

public interface Comments2DAO {

	public List<Comments2> selectComment(int board_No);

	public int insertComment(Comments2 comment);

}
