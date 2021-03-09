package com.kh.joba.user.chat.model.service;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.chat.model.vo.Chat;
import com.kh.joba.user.common.exception.ChatException;

public interface ChatService {

	List<Map<String, String>> selectChatList();
	
	int insertChat(Chat chat);

	Map<String, String> selectChatRoom(int chatNo);

	void deleteChat(int chatNo);

	
	
	List<Map<String, String>> selectChatList(int cPage, int numPerPage);

	int selectChatTotalContents();


}
