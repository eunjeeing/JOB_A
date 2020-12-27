package com.kh.joba.user.board.model.dao;

import java.util.List;
import java.util.Map;

public interface Board1DAO {

	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int selectBoardTotalContents();
}
