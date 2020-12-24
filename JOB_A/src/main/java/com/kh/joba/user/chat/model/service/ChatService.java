package com.kh.joba.user.chat.model.service;

import java.util.List;
import java.util.Map;

public interface ChatService {

	List<Map<String, String>> selectChatList(int cPage, int numPerPage);

	int selectChatTotalContents();

}
