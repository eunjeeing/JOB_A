package com.kh.joba.user.chat.model.dao;

import java.util.List;
import java.util.Map;

public interface ChatDAO {

	List<Map<String, String>> selectChatList(int cPage, int numPerPage);

	int selectChatTotalContents();

}
