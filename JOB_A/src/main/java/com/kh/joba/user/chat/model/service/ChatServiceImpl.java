package com.kh.joba.user.chat.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.joba.user.chat.model.dao.ChatDAO;
import com.kh.joba.user.chat.model.vo.Chat;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	ChatDAO chatDAO;
	
	@Override
	public List<Map<String, String>> selectChatList() {
		// TODO Auto-generated method stub
		return chatDAO.selectChatList();
	}
	
	@Override
	public Map<String, Integer> insertChat(Chat chat) {
		// TODO Auto-generated method stub
		int chatNo = chatDAO.selectChatSeq();
		chat.setChatNo(chatNo);
		
		int result = chatDAO.insertChat(chat);
		Map<String, Integer> chatRoomNo = new HashMap<String, Integer>();
		if(result > 0) {
			chatRoomNo.put("chatNo", chatNo);
		}
		
		return chatRoomNo;
		
	}

	@Override
	public Map<String, Chat> selectChatRoom(int chatNo) {
		// TODO Auto-generated method stub
		return chatDAO.selectChatRoom(chatNo);
	}

	@Override
	public void deleteChat(int chatNo) {
		// TODO Auto-generated method stub
		chatDAO.deleteChat(chatNo);
	}

	


	
}
