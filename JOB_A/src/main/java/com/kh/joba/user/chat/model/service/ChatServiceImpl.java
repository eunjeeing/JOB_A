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
	public int insertChat(Chat chat) {
		// TODO Auto-generated method stub
		int chatNo = chatDAO.selectChatSeq();
		chat.setChatNo(chatNo);
		
		chatDAO.insertChat(chat);
		
		return chatNo;
		
	}

	@Override
	public Map<String, String> selectChatRoom(int chatNo) {
		// TODO Auto-generated method stub
		return chatDAO.selectChatRoom(chatNo);
	}

	@Override
	public void deleteChat(int chatNo) {
		// TODO Auto-generated method stub
		chatDAO.deleteChat(chatNo);
	}

	
	@Override
	public List<Map<String, String>> selectChatList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return chatDAO.selectChatList(cPage, numPerPage);
	}
	
	@Override
	public int selectChatTotalContents() {
		// TODO Auto-generated method stub
		return chatDAO.selectChatTotalContents();
	}
	


	
}
