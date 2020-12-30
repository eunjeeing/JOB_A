package com.kh.joba.user.chat.model.service;

import java.util.List;
import java.util.Map;

import com.kh.joba.user.chat.model.vo.Chat;
import com.kh.joba.user.chat.model.vo.ChatRoom;
import com.kh.joba.user.common.exception.ChatException;

public interface ChatService {

	List<Map<String, String>> selectChatList(int cPage, int numPerPage);

	int selectChatTotalContents();

	int insertChat(String chatTitle) throws ChatException;

	List<Chat> selectChat(int chatNo);

}
