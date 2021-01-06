package com.kh.joba.user.chat.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.chat.model.vo.Chat;

public interface ChatDAO {

	List<Map<String, String>> selectChatList(int cPage, int numPerPage);

	int selectChatTotalContents();

	int insertChat(Chat chat);

	int selectChatSeq();

	Map<String, String> selectChat(int chatNo);

	Object deleteChat(int chatNo);

}
